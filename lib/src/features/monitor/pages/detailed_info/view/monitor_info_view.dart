part of '../monitor_info_page.dart';

class _MonitorView extends StatelessWidget {
  final String typeName;

  final List<TalkerData> exceptions;
  final ISpectOptions options;
  final void Function(BuildContext, TalkerData)? onCopyTap;
  const _MonitorView({
    required this.typeName,
    required this.exceptions,
    required this.options,
    required this.onCopyTap,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            typeName,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final data = exceptions[index];
                  return TalkerDataCards(
                    data: data,
                    onCopyTap: () => onCopyTap?.call(context, data),
                    color: getTypeColor(
                      isDark: context.isDarkMode,
                      key: data.title,
                    ),
                    backgroundColor: context.ispectTheme.cardColor,
                  );
                },
                childCount: exceptions.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
          ],
        ),
      );
}
