/// movePlayerTowardMouseIfFree()
var forwardSpeed;
if (keyboard_check(sprintKey)) { // Is sprinting
    forwardSpeed = baseSpeed * sprintSpeedMultiplier * speedMod * roomSpeedMod; // Speed with sprint
}
else {
    forwardSpeed = baseSpeed * speedMod * roomSpeedMod; // Speed
}

// Planned movement location
var newX = self.x + lengthdir_x(forwardSpeed, direction);
var newY = self.y + lengthdir_y(forwardSpeed, direction);

// Check if planned movement location is empty
if (place_empty(self.x, newY)) {
    self.y += lengthdir_y(forwardSpeed, direction); // Move in the empty direction
}
if (place_empty(newX, self.y)) {
    self.x += lengthdir_x(forwardSpeed, direction); // Move in the empty direction
}
