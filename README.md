John
====

Can I go?


### Usage

    $ bundle exec foreman start

Open a web browser: `http://localhost:9393`

### Testing

In a terminal window:

    # redis-server

In a separate terminal:

    # rake

### CLI

    $ thor bathroom:status
    > The john is not occupied.

### Running with init.d

You may need to use sudo for these commands:

    $ cp scripts/john.init.d.sample /etc/init.d/john
    $ chmod +x /etc/init.d/john
    $ /etc/init.d/john start

### Performance testing

We use JMeter to test server performance.

    $ brew install jmeter
    $ rake performance:test

Then wait. You will see output like:

summary +      9 in    35s =    0.3/s Avg: 14273 Min: 14174 Max:
14397 Err:     0 (0.00%)
summary =     21 in    70s =    0.3/s Avg: 15163 Min: 13002 Max: 20387
Err:     0 (0.00%)

The key metric is the `0.3/s` metric, which means that at the 35 second
mark, the server was able to respond to 0.3 requests per second.
