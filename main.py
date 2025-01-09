from compute import ZigComputeLib
import time

def main() -> None:
    start_time = time.time_ns()
    # Load the library with type information
    zigpi = ZigComputeLib()
    end_time = time.time_ns()
    print(f"Time taken to load library: {(end_time - start_time) // 1_000_000} ms")

    start_time = time.process_time_ns()
    # Calculate pi with type safety
    result = zigpi.calculate_pi(100_000_000)
    end_time = time.process_time_ns()
    print(f"Time taken to calculate pi: {(end_time - start_time) // 1_000_000} ms")
    print(f"π ≈ {result:.6f}")


if __name__ == "__main__":
    main()
