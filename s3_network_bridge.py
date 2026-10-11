import socket
import datetime

HOST = '0.0.0.0'
PORT = 8080

server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server.bind((HOST, PORT))

print("========================================")
print(" S3 🤝 I3 LOCAL NODE BRIDGE LISTENER")
print(f" Bound to 0.0.0.0:{PORT} (Standard Dev Port)")
print(" Target Nodes:")
print("   - Galaxy Z Flip 7 (192.168.12.179)")
print("   - iPhone Air      (192.168.12.149)")
print("   - REVVL Tablet    (192.168.12.170)")
print("========================================\n")

try:
    while True:
        data, addr = server.recvfrom(1024)
        timestamp = datetime.datetime.now().strftime("%H:%M:%S")
        print(f"[{timestamp}] HANDSHAKE from {addr[0]}:{addr[1]} -> {data.decode('utf-8', errors='ignore')}")
except KeyboardInterrupt:
    print("\nBridge stopped cleanly.")
    server.close()
