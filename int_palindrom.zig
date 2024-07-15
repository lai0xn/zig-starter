const std = @import("std");

pub fn main() !void {
    var buffer: [10]u8 = undefined;
    const stdin = std.io.getStdIn().reader();
    const read_bytes = try stdin.readUntilDelimiter(&buffer, '\n');
    var number = try std.fmt.parseInt(u16, read_bytes, 10);
    var rev: u16 = 0;
    while (number > 0) {
        rev = rev * 10 + @mod(number, 10);
        number = @divTrunc(number, 10);
    }

    if (number == rev) {
        std.debug.print("the number is palindrome\n", .{});
    } else {
        std.debug.print("the number is not palindrome\n", .{});
    }
}
