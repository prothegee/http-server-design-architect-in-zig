const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const v1 = b.addExecutable(.{
        .name = "http_server_v1",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/http_server_v1.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const v2 = b.addExecutable(.{
        .name = "http_server_v2",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/http_server_v2.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const v3 = b.addExecutable(.{
        .name = "http_server_v3",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/http_server_v3.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    b.installArtifact(v1);
    b.installArtifact(v2);
    b.installArtifact(v3);
}
