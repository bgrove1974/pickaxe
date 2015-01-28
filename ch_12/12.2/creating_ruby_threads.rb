# CREATING RUBY THREADS

# Creating a new thread is pretty straightforward. The code that follows is a simple example.
# It downloads a set of web pages in parallel. For each URL that it is asked to download, the code creates a separate thread that handles the HTTP transaction.

require 'net/http'

pages = %w( rubycentral.org  slashdot.org  www.google.com )

threads = pages.map do |page_to_fetch|
  Thread.new(page_to_fetch) do |url|
    http = Net::HTTP.new(url, 80)
    print "Fetching: #{url}\n"
    resp = http.get('/')
    print "Got #{url}:  #{resp.message}\n"
  end
end
threads.each {|thr|  thr.join }

# Let's look at this code in more detail, because a few subtle things are happening.

# New threads are created with the Thread.new call. It is given a block that contains the code to be run in a new thread. In our case, the block uses the net/http library to fetch the top page from each of our nominated sites. Our tracing clearly shows that these fetches are going on in parallel.

# When we create the thread, we pass the required URL as a parameter. This parameter is passed to the block as url. Why do we do this, rather than simply using the value of the variable page_to_fetch within the block?

# A thread shares all global, instance, and local variables that are in existence at the time the thread starts. As anyone with a kid brother can tell you, sharing isn't always a good thing. In this case, all three threads would share the variable page_to_fetch. The first thread gets started, and page_to_fetch is set to "rubycentral.org". In the meantime, the loop creating the threads is still running. The second time around, page_to_fetch is set to "slashdot.org". If the first thread has not yet finished using the page_to_fetch variable, it will suddenly start using the new value. These kinds of bugs are difficult to track down.

# However, local variables created within a thread's block are truly local to that thread -- each thread will have its own copy of these variables. In our case, the variable url will be set at the time the thread is created, and each thread will have its own copy of the page address. You can pass any number of arguments into the block via Thread.new.

# This code also illustrates a gotcha. Inside the loop, the threads use print to write out the messages, rather than puts. Why?
# Behind the scenes, puts splits its work into two chunks: it writes its argument, and then it writes a newline. Between these two, a thread could get scheduled, and the output would be interleaved. Calling print with a single string tat already contains the newline gets around the problem.

# MANIPULATING RUBY THREADS 

# Another subtlety occurs on the last line of our download program. Why do we call join on each of the threads we created?

# When a Ruby program terminates, all threads are killed, regardless of their states. However, you can wait for a particular thread to finish by calling that thread's Thread#join method. The calling thread will block until the given thread is finished. By calling join on each of the requester threads, you cn make sure that all three requests have completed before you terminate the main program. If you don't want to block forever, you can give join a timeout parameter -- if the timeout expires before the thread terminates, the join call returns nil. another variant of join, the method Thread#value, returns the value of the last statement executed by the thread.

# In addition to join, a few other handy routines are used to manipulate threads. The current thread is always accessible using Thread.current. You can obtain a list of all threads using Thread.list, which returns a list of all Thread objects that are runnable or stopped. To determine the status of a particular thread, you can use Thread#status and Thread#alive?.

# You can adjust the priority of a thread using Thread#priority=. Higher-priority threads will run before lower-priority threads. We'll talk more about thread scheduling, and stopping and starting threads, in just a bit.
