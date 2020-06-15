#!/usr/bin/python3
import zmq
import argparse
from os.path import expanduser

DEFAULT_NOTIFY_PORT = 7333

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", help="ktrl's notify port")
    args = parser.parse_args()

    if args.port == None:
        port = DEFAULT_NOTIFY_PORT
    else:
        port = int(args.port)

    context = zmq.Context()
    endpoint = "tcp://127.0.0.1:" + str(port)
    socket = context.socket(zmq.SUB)
    socket.connect(endpoint)
    socket.setsockopt(zmq.SUBSCRIBE, b"layer")
    print("Connected to ktrl's notification server: " + endpoint)

    on_set = set()
    out_path = expanduser("~/.ktrl.state")
    print("Out file = " + out_path)
    out = open(out_path, "wb+")

    while True:
        message = socket.recv()
        topic, message = message.split(b" ")
        idx, state = message.split(b":")

        if state == b"on":
            on_set.add(idx)
        elif state == b"off":
            on_set.discard(idx)

        # on_strs = map(lambda x: str(x), list(on_set))
        out_str = b" ".join(list(on_set)) + b"\n"
        print(b"WRITE: " + out_str)

        out.truncate(0)
        out.write(out_str)
        out.flush()


if __name__ == "__main__":
    main()
