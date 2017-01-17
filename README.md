# ClamAV docker

Allows to scan a directory content in search of viruses.

## Goal
The main purpose of that small container is to allow people to scan a file in a convenient way, without having
to install ClamAV nor update it nor configure it on their computer.

My usecase was easy: I got a spam, with an attached file, and just wanted to check it (I knew more or less its content).

## Usage
```Bash
$ git clone https://github.com/cjeanneret/docker-clamav.git
$ cd docker-clamav
$ docker build -t clamav:latest .
$ mkdir virus && mv <files> virus
$ ./run
```
## What will it do
- Create a docker image based on debian latest, with clamav and sanesecurity.com lists
- Mount a volume for the virus lists/definitions
- Mount "virus" in /virus
- Ensure all is up-to-date regarding clamav definitions/lists
- Start a scan on /virus directory with some options
