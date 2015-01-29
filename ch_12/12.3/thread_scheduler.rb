# CONTROLLING THE THREAD SCHEDULER

# In a well-designed application, you'll normally just let threads do their thing; building timing dependencies into a multithreaded application is generally considered to be bad form, because it makes the code farm more complex and also prevents the thread scheduler from optimizing the execution of your program.

# The Thread class provides a number of methods that control the scheduler:

# Invoking thread.stop stops the current thread.
# Thread.run arranges for a particular thread to be run.
# Thread.pass deschedules the current thread, allowing others to run.
# Thread#join and Thread#value suspend the calling thread until a given thread finishes.

# These last two methods are the only low-level thread control methods that the average person should use.
# In fact, we now consider most of the other low-level thread control methods to be too deangerous to use correctly in programs that we write. Some of these primitives are actually unsafe in use (see pp 167 footnote 3).
# Fortunately, Ruby has support for higher-level thread synchronization.
