# TEE Anon Hidden Service

Can you serve an app from an anonymous Dstack node that doesn't reveal its IP address?

This docker compose example sets up a Anon hidden service and serves an nginx website from that. Unlike other Dstack examples using tproxy, this one avoids exposing ports on the host at all. It uses the Anon network itself as a reverse proxy.

![image](https://github.com/user-attachments/assets/ff1b7847-4d8f-45eb-8cb3-790bf73765ca)


## Overview

The setup consists of two main components:
- A Anon service that creates and manages the hidden service
- An Nginx server that serves the TEE attestation data

When accessed through Anon Browser, the service displays:
- The .onion address it's serving on
- TDX remote attestation from /var/run/tappd.sock

The remote attestation uses the hash of the .onion address as the quote report data.

The service automatically generates a new .onion address on first launch and maintains it across restarts through the persistent `Anon_data` volume.

## To run locally

1. Run the containers:
   ```bash
   docker compose up -d
   ```
2. The onion address will be displayed in the Nginx container logs:
   ```bash
   docker compose logs nginx
   ```

