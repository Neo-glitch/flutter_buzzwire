import 'package:buzzwire/core/constants/colors.dart';
import 'package:buzzwire/core/utils/extensions/context_extension.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_app_bar.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_bottom_frame.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_circular_image.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_country_picker.dart';
import 'package:buzzwire/src/shared/presentation/widgets/buzzwire_progress_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = "Devil";

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileImage(),
                    const Gap(40),
                    ..._buildInputSection()
                  ],
                ),
              ),
            ),
          ),
          _buildBottomFrame()
        ],
      ),
    );
  }

  Widget _buildBottomFrame() {
    return BuzzWireBottomFrame(
      child: BuzzWireProgressButton(
        text: const Text("Save"),
        isLoading: false,
        onPressed: () {},
      ),
    );
  }

  List<Widget> _buildInputSection() {
    return [
      _buildInputHeader("Email"),
      const Gap(10),
      TextField(
        enabled: false,
        controller: _emailController,
      ),
      const Gap(20),
      _buildInputHeader("Username"),
      const Gap(10),
      TextField(
        controller: _userNameController,
      ),
      const Gap(20),
      _buildInputHeader("phone"),
      const Gap(10),
      TextField(
        keyboardType: TextInputType.phone,
        controller: _phoneNumberController,
      ),
      const Gap(20),
      _buildInputHeader("country"),
      const Gap(10),
      BuzzWireCountryPicker(
        onSelected: (country) {},
      )
    ];
  }

  Widget _buildInputHeader(String title) {
    return Text(
      title,
      style: context.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: BuzzWireColors.darkGrey,
      ),
    );
  }

  Center _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          BuzzWireCircularImage(
            radius: 80,
            borderColor: context.primaryColor.withOpacity(0.7),
            borderWidth: 2,
            imageUrl: "https://pixlr.com/images/generator/photo-generator.webp",
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: const CircleAvatar(
                radius: 16,
                child: FaIcon(
                  FontAwesomeIcons.pen,
                  size: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BuzzWireAppBar(
      title: Text(
        "Profile",
        style: context.titleLarge?.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
}
