LEN = 26;

SWITCH_HOLE_D1 = 3.78;
SWITCH_HOLE_D2 = 5;
MOUNT_HOLE_D = 3.2;
HOLE_DIST = 14;
HOLE_D = 3.78;

NOZZLE_D = 0.4;

WALL_THICKNESS = NOZZLE_D * 5;

CUT = 0.001;

module plate(d1, d2) {
  difference() {
    cube([LEN, LEN, WALL_THICKNESS], center=true);
    for (x = [1, -1]) {
      for (y = [1, -1]) {
        translate([HOLE_DIST / 2 * x, HOLE_DIST / 2 * y, 0]) {
          cylinder(h=WALL_THICKNESS+CUT, d1=HOLE_D, d2=d2, center=true, $fn=30);
        }
      }
    }
  }
}

union() {
  plate(d1=SWITCH_HOLE_D1, d2=SWITCH_HOLE_D2);
  rotate([0, 90, 0])
    translate([-(LEN + WALL_THICKNESS) / 2, 0, (LEN - WALL_THICKNESS) / 2 ])
      plate(d1=MOUNT_HOLE_D, d2=MOUNT_HOLE_D);
}
