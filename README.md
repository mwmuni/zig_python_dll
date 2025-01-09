# Monte Carlo π Calculator (Zig + Python)

A reference implementation demonstrating how to create high-performance Python extensions using Zig. Uses Monte Carlo π approximation as an example, showcasing SIMD vectorization, efficient random number generation, and Python/Zig interop.

## Learning Goals

This project demonstrates:
- Writing Python extensions in Zig
- Using SIMD vectorization in Zig
- Efficient memory management patterns
- Python/Zig type system bridging via ctypes
- Modern build tooling integration

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

## Example Usage

```python
from compute import ZigComputeLib

zigpi = ZigComputeLib()
result = zigpi.calculate_pi(100_000_000)  # Use 100M points
print(f"π ≈ {result:.6f}")
```

## Technical Implementation

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

Note: This is a reference implementation intended for learning purposes. For practical π calculation, consider using specialized mathematical libraries.
