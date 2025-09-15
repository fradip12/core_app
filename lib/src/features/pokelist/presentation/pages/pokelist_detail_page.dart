import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/poke/dto/poke_models\.dart';
import '../../../../shared/components/wrapper/globall_sliver_appbar_wrapper.dart';
import '../../../../shared/extensions/ext_misc.dart';
import '../../../../shared/extensions/ext_theme.dart';

@RoutePage()
class PokelistDetailsPage extends StatefulWidget {
  final PokeModels poke;
  const PokelistDetailsPage({super.key, required this.poke});

  @override
  State<PokelistDetailsPage> createState() => _PokelistDetailsPageState();
}

class _PokelistDetailsPageState extends State<PokelistDetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuart,
    ));

    _scaleAnimation = Tween<double>(
      begin:
          1.0, // Start at normal size (Hero animation handles the initial zoom)
      end: 1.2, // Slightly bigger for emphasis
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    // Delay animation to let Hero animation complete first
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              GlobalSliverAppbar(
                context,
                title: widget.poke.name.orEmpty,
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 32.0),
                  height: 240,
                  child: Hero(
                    tag: 'pokemon-${widget.poke.id}',
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Image.network(
                        widget.poke.imageUrl.orEmpty,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.poke.colors,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.poke.xDescription.orEmpty,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
