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
