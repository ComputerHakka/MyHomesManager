import '../../../../data/local/database/database.dart';

abstract class ApartmentsRepository {
  Stream<List<Apartment>> watchAllApartments();
  Future<void> addApartment(String name, String? address);
}
