const std = @import("std");

export fn calculate_pi(n: usize) f64 {
    const seed: u64 = @intCast(std.time.timestamp());
    var randGen = std.rand.DefaultPrng.init(seed);
    var rand = randGen.random();
    const num_points: usize = 1 << 18;

    // Generate a vector of random floats using an inline for loop
    var random_floats: [num_points]f32 = undefined;
    for (0..num_points) |i| {
        random_floats[i] = rand.float(f32);
    }

    // Print the vector
    // std.debug.print("random_floats: {}\n", .{random_floats});
    // std.process.exit(0);

    var counter: u64 = 0;
    var iter: u64 = 0;

    // Process 8 points at a time using SIMD
    const Vec8 = @Vector(8, f32);
    const batch_size = 8;
    const batches = n / batch_size;
    const remainder = n % batch_size;

    const one = @as(f32, 1.0);
    const threshold = @as(Vec8, @splat(one));

    while (iter < batches) : (iter += 1) {
        const vec_idx_1 = (iter * batch_size + 1442695040888963407) % (num_points - batch_size);
        const vec_idx_2 = (iter * batch_size + 307127303663454479) % (num_points - batch_size);
        // Get elements from random array
        const x_vec = Vec8{
            random_floats[vec_idx_1],     random_floats[vec_idx_1 + 1], random_floats[vec_idx_1 + 2], random_floats[vec_idx_1 + 3],
            random_floats[vec_idx_1 + 4], random_floats[vec_idx_1 + 5], random_floats[vec_idx_1 + 6], random_floats[vec_idx_1 + 7],
        };

        const y_vec = Vec8{
            random_floats[vec_idx_2],     random_floats[vec_idx_2 + 1], random_floats[vec_idx_2 + 2], random_floats[vec_idx_2 + 3],
            random_floats[vec_idx_2 + 4], random_floats[vec_idx_2 + 5], random_floats[vec_idx_2 + 6], random_floats[vec_idx_2 + 7],
        };

        // Calculate x^2 + y^2 for all 8 points at once
        const x_squared = x_vec * x_vec;
        const y_squared = y_vec * y_vec;
        const sum_squares = x_squared + y_squared;

        // Compare with threshold and count points inside circle
        const mask = sum_squares < threshold;
        inline for (0..8) |i| {
            if (mask[i]) counter += 1;
        }
    }

    // Handle remaining points
    var i: usize = 0;
    while (i < remainder) : (i += 1) {
        const x = rand.float(f32);
        const y = rand.float(f32);

        if (x * x + y * y < 1.0) {
            counter += 1;
        }
    }

    return 4.0 * (@as(f64, @floatFromInt(counter)) / @as(f64, @floatFromInt(n)));
}

pub fn main() void {}
