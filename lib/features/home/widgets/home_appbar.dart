import 'package:flutter/scheduler.dart';
import 'package:webtree/base/base_ui/base_ui.dart';
import 'package:webtree/features/home/bloc/home_cubit/home_cubit.dart';
import 'package:webtree/res/images.dart';
import '../../../widgets/text_input.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with BaseUI {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: theme(context).primaryDark(),
      expandedHeight: 200.0,
      centerTitle: false,
      pinned: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      stretch: true,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        if (isExpanded && constraints.biggest.height < 150) {
          setExpanded(false);
        }
        if (!isExpanded && constraints.biggest.height > 150) {
          setExpanded(true);
        }
        return FlexibleSpaceBar(
          expandedTitleScale: 1.1,
          collapseMode: CollapseMode.pin,
          titlePadding:
              const EdgeInsets.only(left: 50, right: 50, top: 0, bottom: 10),
          title: SafeArea(
            child: TextInput(
              hintText: 'Search for cities...',
              onChange: of<HomeCubit>(context).updateCity,
              suffixIcon: Icon(
                Icons.search,
                color: theme(context).light(),
              ),

              // color: theme.lightBg().withOpacity(0.5),
            ),
          ),
          background: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: theme(context).dark(),
                image: const DecorationImage(
                    image: AssetImage(
                      Images.weatherBackground,
                    ),
                    fit: BoxFit.fill,
                    opacity: 0.5)),
            child: Column(
              children: [
                const Spacer(flex: 3),
                Text(
                  'Explore the weather!',
                  style: textStyle(
                      fontSize: 24,
                      color: theme(context).light(),
                      fontWeight: FontWeight.w900),
                ),
                const Spacer(flex: 1),
                // Padding(
                //   padding: const EdgeInsets.only(left: 50.0, right: 50),
                //   child: CButton(
                //     onTap: (){
                //     },
                //     child: const AbsorbPointer(
                //       child: TextInput(
                //         height: 50,
                //         hintText: 'Search for cities...',
                //         // color: theme.lightBg().withOpacity(0.5),
                //       ),
                //     ),
                //   ),
                // ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        );
      }),
    );
  }

  setExpanded(bool val) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isExpanded = val;
      });
    });
  }
}
