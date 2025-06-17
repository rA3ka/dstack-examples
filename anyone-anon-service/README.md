# TEE Anyone anon (hidden) Service

This docker compose example sets up a Anon hidden service and serves an nginx website from that. Unlike other Dstack examples using tproxy, this one avoids exposing ports on the host at all. It uses the [Anyone network](https://www.anyone.io/) itself as a reverse proxy.

<img src="https://github.com/user-attachments/assets/109efef7-a2b3-4ff9-8764-1233af841cf9" style="width:70%; height:auto;">

## Overview

The setup consists of two main components:
- A Anon service that creates and manages the hidden service
- An Nginx server that serves the TEE attestation data

When accessed through Anyone network, the service displays:
- The .anon address it's serving on
- TDX remote attestation from /var/run/tappd.sock

The remote attestation uses the hash of the .anon address as the quote report data.

The service automatically generates a new .anon address on first launch and maintains it across restarts through the persistent `anon_data` volume.

## To run locally

1. Run the containers:
   ```bash
   docker compose up -d
   ```
2. The anon address will be displayed in the Nginx container logs:
   ```bash
   docker compose logs nginx
   ```

## URLs

 * Website:           https://anyone.io
 * Documentation:     https://docs.anyone.io
 * Social:            https://x.com/AnyoneFDN

<br>

[![](https://cloud.phala.network/deploy-button.svg)](https://cloud.phala.network/templates/anyone-anon-service)
