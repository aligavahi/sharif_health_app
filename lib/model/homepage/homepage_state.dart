part of 'homepage_cubit.dart';

enum Role { trainee, trainer, admin }

extension StringRoleExtension on String {
  Role get parseRole {
    switch (this) {
      case 'trainee':
        return Role.trainee;
      case 'trainer':
        return Role.trainer;
      case 'admin':
        return Role.admin;
      default:
        return Role.trainee;
    }
  }
}

extension RoleExtension on Role {
  String get displayTitle {
    switch (this) {
      case Role.trainee:
        return 'کاربر';
      case Role.trainer:
        return 'مربی';
      case Role.admin:
        return 'مدیر';
      default:
        return 'کاربر';
    }
  }
}

@immutable
sealed class HomepageState {
  final List<Role> roles;
  final Role selectedRole;
  final int pageNumber;

  const HomepageState(
      {required this.roles,
      required this.selectedRole,
      required this.pageNumber});

  HomepageInitial copyWith({roles, selectedRole, pageNumber});
}

final class HomepageInitial extends HomepageState {
  const HomepageInitial(
      {required super.roles,
      required super.selectedRole,
      required super.pageNumber});

  @override
  HomepageInitial copyWith({roles, selectedRole, pageNumber}) {
    return HomepageInitial(
        roles: roles ?? this.roles,
        selectedRole: selectedRole ?? this.selectedRole,
        pageNumber: pageNumber ?? this.pageNumber);
  }
}
