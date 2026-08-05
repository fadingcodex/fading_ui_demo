part of 'main.dart';

class _DemoTopBar extends StatelessWidget {
  const _DemoTopBar({
    required this.compact,
    required this.themeName,
    required this.onToggleNav,
    required this.onThemeChanged,
  });

  final bool compact;
  final FadingThemeName themeName;
  final VoidCallback onToggleNav;
  final ValueChanged<FadingThemeName> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);
    final FadingThemeGroup activeGroup = themeName.group;
    final List<FadingThemeName> themes = FadingThemeName.forGroup(activeGroup);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (compact) ...<Widget>[
                  _NavButton(onPressed: onToggleNav),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Text(
                    'Fading UI - Widget Documentation',
                    style: theme.titleLarge.copyWith(
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                ),
                Text(
                  '${activeGroup.label} / ${themeName.label}',
                  style: theme.bodyMedium.copyWith(
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Groups', style: theme.labelLarge.copyWith(fontSize: 12)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                for (final FadingThemeGroup group in FadingThemeGroup.values)
                  _ThemeChip(
                    label: group.label,
                    selected: group == activeGroup,
                    onTap: () {
                      final List<FadingThemeName> groupThemes =
                          FadingThemeName.forGroup(group);
                      final FadingThemeName nextTheme =
                          groupThemes.contains(themeName)
                          ? themeName
                          : groupThemes.first;
                      onThemeChanged(nextTheme);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Themes', style: theme.labelLarge.copyWith(fontSize: 12)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                for (final FadingThemeName item in themes)
                  _ThemeChip(
                    label: item.label,
                    selected: item == themeName,
                    onTap: () => onThemeChanged(item),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 42,
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: theme.surfaceRaised,
          borderRadius: BorderRadius.circular(14),
          boxShadow: _raisedShadows(theme),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _Bar(theme: theme),
            _Bar(theme: theme),
            _Bar(theme: theme),
          ],
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.theme});

  final FadingThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: theme.textPrimary,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class _ThemeChip extends StatelessWidget {
  const _ThemeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? theme.accentStrong : theme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
          boxShadow: selected ? _raisedShadows(theme) : _insetShadows(theme),
        ),
        child: Text(
          label,
          style: theme.labelLarge.copyWith(
            fontSize: 13,
            color: selected ? theme.backgroundStart : theme.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _DemoSidePanel extends StatelessWidget {
  const _DemoSidePanel({
    required this.activePage,
    required this.onPageSelected,
  });

  final DemoPage activePage;
  final ValueChanged<DemoPage> onPageSelected;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);
    final Map<String, List<DemoPage>> groupedPages = _pagesBySection();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B2A57),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Componentes',
              style: theme.titleLarge.copyWith(
                fontSize: 18,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Navega por categoria para revisar demos y API visual de cada widget.',
              style: theme.bodyMedium.copyWith(
                fontSize: 12,
                color: const Color(0xFFCBD5E1),
              ),
            ),
            const SizedBox(height: 14),
            for (final MapEntry<String, List<DemoPage>> entry
                in groupedPages.entries) ...<Widget>[
              Row(
                children: <Widget>[
                  Text(
                    entry.key,
                    style: theme.labelLarge.copyWith(
                      fontSize: 11,
                      color: const Color(0xFFBFDBFE),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A8A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${entry.value.length}',
                      style: theme.labelLarge.copyWith(
                        fontSize: 10,
                        color: const Color(0xFFDBEAFE),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              for (final DemoPage page in entry.value) ...<Widget>[
                _SideNavItem(
                  page: page,
                  selected: page == activePage,
                  onTap: () => onPageSelected(page),
                ),
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 6),
            ],
          ],
        ),
      ),
    );
  }
}

class _SideNavItem extends StatelessWidget {
  const _SideNavItem({
    required this.page,
    required this.selected,
    required this.onTap,
  });

  final DemoPage page;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);
    final _DemoPageMeta meta = _docsMetaFor(page);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1D4ED8) : const Color(0xFF12306A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    page.label,
                    style: theme.labelLarge.copyWith(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '${meta.exampleCount} demos',
                          style: theme.bodyMedium.copyWith(
                            fontSize: 11,
                            color: const Color(0xFFBFDBFE),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2563EB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            meta.status,
                            style: theme.labelLarge.copyWith(
                              fontSize: 9,
                              color: const Color(0xFFDBEAFE),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF93C5FD),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
