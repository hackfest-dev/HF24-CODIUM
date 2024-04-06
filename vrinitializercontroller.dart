// Example of adding player movement using VR controller input
void _onControllerUpdate(VrControllerInput input) {
  if (input is VrControllerInputEvent) {
    final rotation = input.orientation;
    final direction = Vector3(0, 0, -1); // Example forward direction
    direction.applyQuaternion(rotation);

    // Update player position based on direction
    // e.g., playerNode.position += direction * movementSpeed;
  }
}
