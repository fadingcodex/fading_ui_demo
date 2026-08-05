part of 'main.dart';

class _DocsPageLayout extends StatefulWidget {
  const _DocsPageLayout({required this.page, required this.children});

  final DemoPage page;
  final List<Widget> children;

  @override
  State<_DocsPageLayout> createState() => _DocsPageLayoutState();
}

class _DocsPageLayoutState extends State<_DocsPageLayout> {
  final GlobalKey _descriptionKey = GlobalKey();
  final GlobalKey _apiKey = GlobalKey();
  final GlobalKey _examplesKey = GlobalKey();
  int _selectedTab = 2;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTab = index;
    });

    final GlobalKey targetKey = switch (index) {
      0 => _descriptionKey,
      1 => _apiKey,
      _ => _examplesKey,
    };
    final BuildContext? targetContext = targetKey.currentContext;
    if (targetContext == null) {
      return;
    }

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        Container(
          key: _descriptionKey,
          child: _DocsPageHeader(
            page: widget.page,
            selectedTab: _selectedTab,
            onTabSelected: _onTabSelected,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          key: _apiKey,
          child: _DocsApiSection(page: widget.page),
        ),
        const SizedBox(height: 16),
        Container(
          key: _examplesKey,
          child: FadingSurface(
            style: FadingSurfaceStyle.inset,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(
              'Ejemplos',
              style: FadingThemeScope.of(
                context,
              ).titleLarge.copyWith(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...widget.children,
      ],
    );
  }
}

class _DocsPageHeader extends StatelessWidget {
  const _DocsPageHeader({
    required this.page,
    required this.selectedTab,
    required this.onTabSelected,
  });

  final DemoPage page;
  final int selectedTab;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);
    final _DemoPageMeta meta = _docsMetaFor(page);

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Componentes > Flutter > ${page.label}',
            style: theme.bodyMedium.copyWith(color: const Color(0xFF64748B)),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              _HeaderTag(text: meta.section, tone: _HeaderTagTone.muted),
              _HeaderTag(text: meta.status, tone: _HeaderTagTone.success),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            page.label,
            style: theme.displayMedium.copyWith(
              fontSize: 36,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            meta.description,
            style: theme.bodyLarge.copyWith(
              color: const Color(0xFF475569),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              _HeaderTag(text: meta.selector, tone: _HeaderTagTone.selected),
              _HeaderTag(text: meta.widgetClass, tone: _HeaderTagTone.muted),
              ...meta.tags.map(
                (String value) =>
                    _HeaderTag(text: value, tone: _HeaderTagTone.subtle),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _DocsTabs(selectedIndex: selectedTab, onTabSelected: onTabSelected),
        ],
      ),
    );
  }
}

class _DocsApiSection extends StatelessWidget {
  const _DocsApiSection({required this.page});

  final DemoPage page;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('API', style: theme.titleLarge.copyWith(fontSize: 16)),
          const SizedBox(height: 10),
          _DocsMetaStrip(page: page),
        ],
      ),
    );
  }
}

class _DocsTabs extends StatelessWidget {
  const _DocsTabs({required this.selectedIndex, required this.onTabSelected});

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          _DocsTabItem(
            label: 'Descripcion general',
            selected: selectedIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          _DocsTabItem(
            label: 'API',
            selected: selectedIndex == 1,
            onTap: () => onTabSelected(1),
          ),
          _DocsTabItem(
            label: 'Ejemplos',
            selected: selectedIndex == 2,
            onTap: () => onTabSelected(2),
          ),
        ],
      ),
    );
  }
}

class _DocsTabItem extends StatelessWidget {
  const _DocsTabItem({
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFE0E7FF) : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0),
          ),
        ),
        child: Text(
          label,
          style: theme.labelLarge.copyWith(
            fontSize: 12,
            color: selected ? const Color(0xFF1D4ED8) : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}

class _DocsMetaStrip extends StatelessWidget {
  const _DocsMetaStrip({required this.page});

  final DemoPage page;

  @override
  Widget build(BuildContext context) {
    final _DemoPageMeta meta = _docsMetaFor(page);

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        _DocsMetaCell(label: 'SELECTOR', value: meta.selector),
        _DocsMetaCell(label: 'CLASE', value: meta.widgetClass),
        _DocsMetaCell(label: 'CATEGORIA', value: meta.category),
        _DocsMetaCell(label: 'ESTADO', value: meta.status),
        _DocsMetaCell(label: 'EJEMPLOS', value: '${meta.exampleCount} demos'),
      ],
    );
  }
}

class _DocsMetaCell extends StatelessWidget {
  const _DocsMetaCell({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return Container(
      constraints: const BoxConstraints(minWidth: 165, maxWidth: 210),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: theme.labelLarge.copyWith(
              fontSize: 10,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.bodyMedium.copyWith(color: const Color(0xFF0F172A)),
          ),
        ],
      ),
    );
  }
}

enum _HeaderTagTone { selected, muted, subtle, success }

class _HeaderTag extends StatelessWidget {
  const _HeaderTag({required this.text, required this.tone});

  final String text;
  final _HeaderTagTone tone;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    final Color background = switch (tone) {
      _HeaderTagTone.selected => const Color(0xFFE0E7FF),
      _HeaderTagTone.muted => const Color(0xFFE2E8F0),
      _HeaderTagTone.subtle => const Color(0xFFF1F5F9),
      _HeaderTagTone.success => const Color(0xFFDCFCE7),
    };
    final Color textColor = switch (tone) {
      _HeaderTagTone.selected => const Color(0xFF1D4ED8),
      _HeaderTagTone.muted => const Color(0xFF1E293B),
      _HeaderTagTone.subtle => const Color(0xFF64748B),
      _HeaderTagTone.success => const Color(0xFF166534),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: theme.labelLarge.copyWith(fontSize: 11, color: textColor),
      ),
    );
  }
}
