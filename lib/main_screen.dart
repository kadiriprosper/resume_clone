import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resume_clone/providers/state_provider.dart';
import 'package:resume_clone/providers/theme_provider.dart';
import 'package:resume_clone/widgets/detail_segment_widget.dart';
import 'package:resume_clone/widgets/link_chip_widget.dart';
import 'package:resume_clone/widgets/segment_title_widget.dart';
import 'package:url_launcher/link.dart';
import 'package:provider/provider.dart' as pro;

import 'package:resume_clone/constants.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value:
                pro.Provider.of<ThemeProvider>(context).baseTheme == lightTheme,
            onChanged: (value) {
              pro.Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme();
              setState(() {});
            },
            inactiveThumbColor: Colors.black,
            activeColor: Colors.white,
            inactiveTrackColor: Colors.white,
            activeTrackColor: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: ref.watch(themeProvider).rimColor,
                  radius: 70,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 67,
                    backgroundImage: AssetImage(
                      'assets/profile_pic.jpeg',
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Kadiri Ehijie',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 32,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    'Flutter App Developer',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 10),
                !ref.watch(stateProvider).showAboutMe
                    ? SegmentTitleWidget(
                        onTap: () {
                          ref.watch(stateProvider).setShowAboutMe =
                              !ref.watch(stateProvider).showAboutMe;
                          setState(() {});
                        },
                        title: 'About Me',
                      )
                    : const SizedBox(),
                ref.watch(stateProvider).showAboutMe
                    ? DetailSegmentWidget(
                        details:
                            'I am a Flutter developer with a taste of python,\nC/C++ and one who is always eager to learn new things',
                        onClose: () {
                          ref.watch(stateProvider).setShowAboutMe =
                              !ref.watch(stateProvider).showAboutMe;
                          setState(() {});
                        },
                      )
                    : const SizedBox(),
                const SizedBox(height: 10),
                !ref.watch(stateProvider).showWhatIBring
                    ? SegmentTitleWidget(
                        onTap: () {
                          ref.watch(stateProvider).setShowIBring =
                              !ref.watch(stateProvider).showWhatIBring;
                          setState(() {});
                        },
                        title: 'What I Bring',
                      )
                    : const SizedBox(),
                ref.watch(stateProvider).showWhatIBring
                    ? DetailSegmentWidget(
                        details: value,
                        onClose: () {
                          ref.watch(stateProvider).setShowIBring =
                              !ref.watch(stateProvider).showWhatIBring;
                          setState(() {});
                        },
                      )
                    : const SizedBox(),
                const SizedBox(height: 10),
                Wrap(
                  children: const [
                    LinkChipWidget(
                      link: githubLink,
                      color: Colors.black,
                      shadowColor: Colors.grey,
                      icon: MdiIcons.github,
                      label: 'Github',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    LinkChipWidget(
                      link: linkedInLink,
                      label: 'LinkedIn',
                      color: Colors.blue,
                      shadowColor: Colors.white,
                      icon: MdiIcons.linkedin,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
