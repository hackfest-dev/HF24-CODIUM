void _initializeVr() {
  _vrController = VrController();
  _vrController.onControllerInputUpdate.listen(_onControllerUpdate);
  _vrController.initialize();
}
