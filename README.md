# Monte Carlo π Calculator (Zig + Python)

High-performance Monte Carlo π approximation using Zig with Python bindings. Features SIMD vectorization and efficient random number generation.

## Requirements

- Python 3.7+
- Zig 0.13.0+
- UV package manager (optional)

## Quick Start

```powershell
# Build and run
.\build_and_run.ps1
```

## Manual Setup

1. Install Zig 0.13.0+ (via winget or scoop)
2. Build the extension:
```bash
zig build --release=fast
```
3. Move the DLL to the root directory:
```bash
mv zig-out/bin/compute.dll .
```

## Usage

```python
from compute import ZigComputeLib

zigpi = ZigComputeLib()
result = zigpi.calculate_pi(100_000_000)  # Use 100M points
print(f"π ≈ {result:.6f}")
```

## Implementation Details

- SIMD vectorization (8 points at a time)
- Pre-allocated random number buffer
- Efficient memory access patterns
- Native Zig-to-Python bindings via ctypes

## Project Structure

```
├── src/
│   └── compute.zig    # Core implementation
├── compute.py         # Python bindings
├── compute.pyi        # Type hints
├── main.py           # Example usage
└── build.zig         # Build config
```
