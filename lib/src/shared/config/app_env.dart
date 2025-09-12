import 'package:envied/envied.dart';

part 'app_env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SAMPLE_SECRET_VALUE', obfuscate: true)
  static final String sampleSecretValue = _Env.sampleSecretValue;
}
