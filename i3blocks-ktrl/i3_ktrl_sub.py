#!/usr/bin/python3
import os
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

    on_set = set([b"0"])
    out_path = expanduser("~/.ktrl.state")
    print("Out file = " + out_path)
    out = open(out_path, "wb+")

    out.truncate(0)
    out.seek(0, 0)
    out.write(b"KTRL: 0\n")
    out.flush()

    while True:
        message = socket.recv()
        topic, message = message.split(b" ")
        idx, state = message.split(b":")

        if state == b"on":
            on_set.add(idx)
        elif state == b"off":
            on_set.discard(idx)

        sorted_ons = sorted(list(on_set))
        out_str = b"KTRL " + b"".join(sorted_ons) + b"\n"
        print(out_str)

        out.truncate(0)
        out.seek(0, 0)
        out.write(out_str)
        out.flush()

        os.system("pkill -SIGRTMIN+12 i3blocks")

if __name__ == "__main__":
    main()
