from ctypes import CDLL

class ZigComputeLib(CDLL):
    """Interface for the Zig Pi calculation library."""
    
    def __init__(self) -> None: ...
    
    def calculate_pi(self, n: int) -> float:
        """Calculate an approximation of π using Monte Carlo method.
        
        Args:
            n: Number of points to use in the Monte Carlo simulation.
                Higher values give more accurate results.
            
        Returns:
            float: An approximation of π (roughly 3.14159...)
        """
        ... 