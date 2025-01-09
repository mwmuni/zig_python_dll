from ctypes import CDLL, c_double, c_size_t
import os

class ZigComputeLib(CDLL):
    def __init__(self):
        # Get the directory containing this Python file
        lib_dir = os.path.dirname(os.path.abspath(__file__))
        # Construct path to the DLL
        lib_path = os.path.join(lib_dir, "compute.dll")
        
        super().__init__(lib_path)
        
        # Set the correct argument and return types for the calculate_pi function
        self.calculate_pi.argtypes = [c_size_t]
        self.calculate_pi.restype = c_double