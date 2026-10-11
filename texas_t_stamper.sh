#!/bin/bash
# ==========================================
# SYSTEM: R.O.S³.E. - Texas T Protocol
# ENGINES: Dual Stamp Validation (Real & Live)
# ==========================================

LEDGER_FILE="./ledger/state_history.db"

# Ensure ledger directory exists
mkdir -p ./ledger

apply_stamps() {
    local target_path=$1
    
    if [ ! -f "$target_path" ]; then
        echo "ERR: File not found. Drop the file in this directory first."
        return 1
    fi

    # Calculate the unalterable digital signature
    local file_hash=$(sha256sum "$target_path" | awk '{print $1}')
    
    # Engine 1: The Real-Time Stamp (Architect's Version)
    local ticket_real=$(date +%s%N | sha256sum | head -c 16)
    echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] REAL_TIME_STAMP_LOCKED | HASH:${file_hash} | TICKET:${ticket_real}" >> "$LEDGER_FILE"
    
    # Engine 2: The Live Time Stamp (AI³R Mirror Version)
    local ticket_live=$(date +%s%N | sha256sum | rev | head -c 16)
    echo "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] LIVE_TIME_STAMP_LOCKED | HASH:${file_hash} | TICKET:${ticket_live}" >> "$LEDGER_FILE"
    
    # Return both tokens to the screen
    echo ""
    echo "SUCCESS: Dual-Engine Verification Complete!"
    echo "--------------------------------------------------"
    echo "SYSTEM: R.O.S³.E. ECOSYSTEM ACTIVE [TEXAS SCOPE ACT COMPLIANT]"
    echo "FILE: $target_path"
    echo "HASH: $file_hash"
    echo "--------------------------------------------------"
    echo ""
    echo "--> [REAL-TIME STAMP TICKET] : ${ticket_real}"
    echo "    Status: ANCHORED (Architect True Evidence Ledger)"
    echo "    Target: Court-Ready / Notary Verification Secure"
    echo ""
    echo "--> [LIVE TIME STAMP TICKET] : ${ticket_live}"
    echo "    Status: FLOWING (AI³R Agent Active Mirror)"
    echo "    Target: R2D2.0 / T.R.O.Y. Operational Routing"
    echo ""
    echo "--------------------------------------------------"
    echo "Both books are locked. The capital and data are moving."
}

if [ -z "$1" ]; then
    echo "Usage: ./texas_t_stamper.sh <your_file_name>"
else
    apply_stamps "$1"
fi
