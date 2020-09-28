include <variables.scad>

module hullMount() {
    difference() {
        hullMountBody();

        // Hole
        translate([0, hullMountDepth + DIFFERENCE_FIX, hullMountHeight / 2])
        rotate([90, 0, 0])
        cylinder(h = hullMountDepth + DIFFERENCE_FIX_2, r = hullMountHole);
    }

    translate([hullMountWidth - hullMountPinOffset, hullMountPinRadius + hullMountPinOffset, -hullThickness])
    cylinder(h = hullThickness, r = hullMountPinRadius);

    translate([hullMountWidth - hullMountPinOffset,  hullMountDepth - hullMountPinRadius - hullMountPinOffset, -hullThickness])
    cylinder(h = hullThickness, r = hullMountPinRadius);

    translate([-hullMountWidth + hullMountPinOffset, hullMountPinRadius + hullMountPinOffset, -hullThickness])
    cylinder(h = hullThickness, r = hullMountPinRadius);

    translate([-hullMountWidth + hullMountPinOffset,  hullMountDepth - hullMountPinRadius - hullMountPinOffset, -hullThickness])
    cylinder(h = hullThickness, r = hullMountPinRadius);
}

module hullMountBody() {
    difference() {
        union() {
            translate([0, hullMountDepth, hullMountHeight / 2])
            rotate([90, 0, 0])
            cylinder(h = hullMountDepth, r = hullMountHeight / 2);

            translate([-hullMountWidth, 0, 0])
            cube([hullMountWidth * 2, hullMountDepth, hullMountHeight / 2]);
        }

        translate([-hullMountWidth, hullMountDepth + DIFFERENCE_FIX, hullMountHeight / 2])
        rotate([90, 0, 0])
        cylinder(h = hullMountDepth + DIFFERENCE_FIX_2, r = hullMountHeight / 2);

        translate([hullMountWidth, hullMountDepth + DIFFERENCE_FIX, hullMountHeight / 2])
        rotate([90, 0, 0])
        cylinder(h = hullMountDepth + DIFFERENCE_FIX_2, r = hullMountHeight / 2);
    }
}

hullMount();
