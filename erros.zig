const std = @import("std");

const stdin = std.io.getStdIn().reader();

const MinorError = error{Minor};

fn is_adult(age: i8) !void {
    if (age < 18) {
        return MinorError.Minor;
    }
}

pub fn main() !void {
    var buffer: [10]u8 = undefined;
    const input = try stdin.readUntilDelimiter(&buffer, '\n');
    const input_int = try std.fmt.parseInt(i8, input, 10);
    is_adult(input_int) catch |err| switch (err) {
        error.Minor => {
            std.debug.print("You are a minor\n", .{});
            return;
        },
    };
    std.debug.print("Cool !\n", .{});
}
