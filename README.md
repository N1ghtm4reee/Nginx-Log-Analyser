# Nginx-Log-Analyser

A simple Bash script to analyze Nginx or Apache-style access logs and extract useful statistics such as:

- Top 5 IP addresses with the most requests
- Top 5 requested paths (URLs)
- Top 5 response status codes (2xx, 3xx, 4xx, 5xx)
- Top 5 user agents

## 📜 Description

This script parses standard web server access logs (such as those from Nginx or Apache in the **combined log format**) and outputs insightful usage statistics directly to the terminal.


## 🚀 Usage

```bash
./nginx_log_analyser.sh access.log

chmod +x nginx_log_analyser.sh


=====================================
Top 5 IP addresses with the most requests
=====================================
192.168.0.1 - 32 requests
...

=====================================
Top 5 most requested paths
=====================================
/index.html - 15 requests
...

=====================================
Top 5 response status codes
=====================================
200 - 45 times
...

=====================================
Top 5 user agents
=====================================
Mozilla/5.0 - 30 times
...
