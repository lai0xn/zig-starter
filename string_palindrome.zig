const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    var buffer: [100]u8 = undefined;
    const input = try stdin.readUntilDelimiter(&buffer, '\n');
    var is_palindrom: bool = true;
    for (input, 0..) |_, index| {
        if (input[index] != input[input.len - 1 - index]) {
            is_palindrom = false;
        }
    }
    switch (is_palindrom) {
        true => std.debug.print("the word is a palindrome\n", .{}),
        false => std.debug.print("the word is not a palindrome\n", .{}),
    }
}
