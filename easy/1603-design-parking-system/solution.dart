class ParkingSystem {
  late List<int> slots;

  ParkingSystem(int big, int medium, int small) {
    slots = [0, big, medium, small];
  }

  bool addCar(int carType) {
    if (slots[carType] == 0) return false;
    slots[carType]--;
    return true;
  }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * ParkingSystem obj = ParkingSystem(big, medium, small);
 * bool param1 = obj.addCar(carType);
 */