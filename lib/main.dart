import 'package:fading_ui/fading_ui.dart';
import 'package:flutter/material.dart' show TimeOfDay;
import 'package:flutter/widgets.dart';

part 'demo_shared.dart';
part 'demo_navigation.dart';
part 'demo_docs_layout.dart';
part 'demo_pages.dart';

void main() {
  runApp(const FadingDemoApp());
}

class FadingDemoApp extends StatefulWidget {
  const FadingDemoApp({super.key});

  @override
  State<FadingDemoApp> createState() => _FadingDemoAppState();
}

class _FadingDemoAppState extends State<FadingDemoApp> {
  FadingThemeName _themeName = FadingThemeName.dawn;
  DemoPage _activePage = DemoPage.textField;
  bool _mobileNavOpen = false;

  bool _buttonEnabled = true;
  bool _insetContainer = false;
  bool _checkboxValue = true;
  bool _switchValue = false;
  double _sliderValue = 42;
  double _rangeSliderStart = 20;
  double _rangeSliderEnd = 80;
  String _selectedSignal = 'Alpha';
  String _selectedChannel = 'Beta';
  List<String> _selectedChannels = <String>['Alpha'];
  List<String> _selectedChipFilters = <String>['Beta'];
  List<String> _inputChips = <String>['Primary'];
  List<String> _breadcrumbPath = <String>[
    'Home',
    'Operations',
    'Telemetry',
    'Node 7',
  ];
  int _richBreadcrumbIndex = 2;
  int? _expandedAccordionIndex = 0;
  DateTime _selectedDate = DateTime(2026, 6, 16);
  TimeOfDay _selectedTime = const TimeOfDay(hour: 14, minute: 32);
  int _currentDataPage = 1;
  int _tableSortColumnIndex = 1;
  bool _tableSortAscending = false;
  int? _selectedTelemetryRowId;
  int _selectedTab = 0;
  String _signal = '';
  String _status = 'Standing by.';

  static const int _rowsPerPage = 6;
  static const List<_TelemetryRecord> _telemetryRows = <_TelemetryRecord>[
    _TelemetryRecord(101, 'Aster', 72, 'Stable'),
    _TelemetryRecord(102, 'Nyx', 61, 'Stable'),
    _TelemetryRecord(103, 'Cinder', 88, 'Critical'),
    _TelemetryRecord(104, 'Dawnline', 55, 'Watch'),
    _TelemetryRecord(105, 'Echo', 67, 'Stable'),
    _TelemetryRecord(106, 'Farpoint', 39, 'Watch'),
    _TelemetryRecord(107, 'Gale', 91, 'Critical'),
    _TelemetryRecord(108, 'Helios', 74, 'Stable'),
    _TelemetryRecord(109, 'Ion', 49, 'Watch'),
    _TelemetryRecord(110, 'Juno', 63, 'Stable'),
    _TelemetryRecord(111, 'Kite', 58, 'Stable'),
    _TelemetryRecord(112, 'Lumen', 83, 'Critical'),
    _TelemetryRecord(113, 'Morrow', 65, 'Stable'),
    _TelemetryRecord(114, 'Nadir', 43, 'Watch'),
    _TelemetryRecord(115, 'Orchid', 76, 'Stable'),
    _TelemetryRecord(116, 'Pyre', 90, 'Critical'),
    _TelemetryRecord(117, 'Quartz', 69, 'Stable'),
    _TelemetryRecord(118, 'Rook', 47, 'Watch'),
    _TelemetryRecord(119, 'Solace', 62, 'Stable'),
    _TelemetryRecord(120, 'Talon', 86, 'Critical'),
    _TelemetryRecord(121, 'Umber', 52, 'Watch'),
    _TelemetryRecord(122, 'Vesper', 70, 'Stable'),
    _TelemetryRecord(123, 'Warden', 78, 'Stable'),
    _TelemetryRecord(124, 'Zephyr', 57, 'Stable'),
  ];

  static const List<String> _tabLabels = <String>[
    'Signals',
    'Telemetry',
    'Archive',
  ];

  static const List<String> _defaultBreadcrumbPath = <String>[
    'Home',
    'Operations',
    'Telemetry',
    'Node 7',
  ];

  int get _totalDataPages => (_telemetryRows.length / _rowsPerPage).ceil();

  List<_TelemetryRecord> get _visibleTelemetryRows {
    final List<_TelemetryRecord> sortedRows = _telemetryRows.toList();
    sortedRows.sort((a, b) {
      final int base;
      switch (_tableSortColumnIndex) {
        case 0:
          base = a.node.compareTo(b.node);
        case 1:
          base = a.throughput.compareTo(b.throughput);
        case 2:
          base = a.status.compareTo(b.status);
        default:
          base = a.node.compareTo(b.node);
      }
      return _tableSortAscending ? base : -base;
    });

    final int start = (_currentDataPage - 1) * _rowsPerPage;
    final int end = (start + _rowsPerPage).clamp(0, sortedRows.length);
    if (start >= sortedRows.length) {
      return <_TelemetryRecord>[];
    }
    return sortedRows.sublist(start, end);
  }

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeData.fromTheme(_themeName);

    return FadingThemeScope(
      theme: _themeName,
      data: theme,
      child: WidgetsApp(
        color: const Color(0xFFF7F8FA),
        debugShowCheckedModeBanner: false,
        pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
          return PageRouteBuilder<T>(
            settings: settings,
            pageBuilder: (BuildContext context, _, _) => builder(context),
          );
        },
        home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool compact = constraints.maxWidth < 920;
            if (!compact && _mobileNavOpen) {
              _mobileNavOpen = false;
            }

            return DefaultTextStyle(
              style: theme.bodyLarge.copyWith(color: const Color(0xFF1F2937)),
              child: Container(
                color: const Color(0xFFF7F8FA),
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      _DemoTopBar(
                        compact: compact,
                        themeName: _themeName,
                        onToggleNav: () {
                          setState(() {
                            _mobileNavOpen = !_mobileNavOpen;
                          });
                        },
                        onThemeChanged: (FadingThemeName value) {
                          setState(() {
                            _themeName = value;
                            _status =
                                'Theme: ${value.group.label} / ${value.label}';
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Text(
                          _status,
                          style: theme.bodyMedium.copyWith(
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: compact
                            ? _buildCompactLayout(theme)
                            : _buildWideLayout(theme),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWideLayout(FadingThemeData theme) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 260,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 12, 20),
            child: _DemoSidePanel(
              activePage: _activePage,
              onPageSelected: (DemoPage page) {
                setState(() {
                  _activePage = page;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 20, 20),
            child: _buildPageContent(theme),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactLayout(FadingThemeData theme) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: _buildPageContent(theme),
        ),
        if (_mobileNavOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _mobileNavOpen = false;
                });
              },
              child: DecoratedBox(
                decoration: BoxDecoration(color: const Color(0x88000000)),
              ),
            ),
          ),
        if (_mobileNavOpen)
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: _DemoSidePanel(
                  activePage: _activePage,
                  onPageSelected: (DemoPage page) {
                    setState(() {
                      _activePage = page;
                      _mobileNavOpen = false;
                    });
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPageContent(FadingThemeData theme) {
    switch (_activePage) {
      case DemoPage.textField:
        return _InputsPage(
          page: _activePage,
          signal: _signal,
          sliderValue: _sliderValue,
          visibleSections: const <String>{'text-field'},
          onSignalChanged: (String value) {
            setState(() {
              _signal = value;
              _status = value.isEmpty ? 'Awaiting signal...' : 'Signal: $value';
            });
          },
          onSliderChanged: (double value) {
            setState(() {
              _sliderValue = value;
              _status = 'Drive intensity: ${value.round()}%';
            });
          },
        );
      case DemoPage.slider:
        return _InputsPage(
          page: _activePage,
          signal: _signal,
          sliderValue: _sliderValue,
          visibleSections: const <String>{'slider'},
          onSignalChanged: (String value) {
            setState(() {
              _signal = value;
              _status = value.isEmpty ? 'Awaiting signal...' : 'Signal: $value';
            });
          },
          onSliderChanged: (double value) {
            setState(() {
              _sliderValue = value;
              _status = 'Drive intensity: ${value.round()}%';
            });
          },
        );
      case DemoPage.rangeSlider:
        return _RangeSliderPage(
          page: _activePage,
          startValue: _rangeSliderStart,
          endValue: _rangeSliderEnd,
          visibleSections: const <String>{'range-slider'},
          onChanged: (RangeValues value) {
            setState(() {
              _rangeSliderStart = value.start;
              _rangeSliderEnd = value.end;
              _status =
                  'Selected range: ${value.start.round()}% - ${value.end.round()}%';
            });
          },
        );
      case DemoPage.checkbox:
      case DemoPage.switchControl:
      case DemoPage.tabBar:
      case DemoPage.radioGroup:
      case DemoPage.select:
        return _SelectionPage(
          page: _activePage,
          checkboxValue: _checkboxValue,
          switchValue: _switchValue,
          selectedSignal: _selectedSignal,
          selectedChannel: _selectedChannel,
          selectedChannels: _selectedChannels,
          selectedTab: _selectedTab,
          tabLabels: _tabLabels,
          visibleSections: switch (_activePage) {
            DemoPage.checkbox => const <String>{'checkbox-switch'},
            DemoPage.switchControl => const <String>{'checkbox-switch'},
            DemoPage.tabBar => const <String>{'tab-bar'},
            DemoPage.radioGroup => const <String>{'radio-group'},
            DemoPage.select => const <String>{'select-single', 'select-multi'},
            _ => null,
          },
          onCheckboxChanged: (bool value) {
            setState(() {
              _checkboxValue = value;
              _status = value ? 'Pulse lock engaged.' : 'Pulse lock released.';
            });
          },
          onSwitchChanged: (bool value) {
            setState(() {
              _switchValue = value;
              _status = value ? 'Aux relay online.' : 'Aux relay idle.';
            });
          },
          onTabChanged: (int value) {
            setState(() {
              _selectedTab = value;
              _status = 'View switched to ${_tabLabels[value]}.';
            });
          },
          onRadioChanged: (String value) {
            setState(() {
              _selectedSignal = value;
              _status = 'Channel selected: $value';
            });
          },
          onSingleSelectChanged: (String? value) {
            setState(() {
              _selectedChannel = value ?? _selectedChannel;
              _status = 'Single select channel: $_selectedChannel';
            });
          },
          onSelectChanged: (List<String> values) {
            setState(() {
              _selectedChannels = values;
              _status = values.isEmpty
                  ? 'No channels selected.'
                  : 'Channels selected: ${values.join(', ')}';
            });
          },
        );
      case DemoPage.pagination:
      case DemoPage.dataTable:
        return _NavigationPage(
          page: _activePage,
          currentPage: _currentDataPage,
          totalPages: _totalDataPages,
          rows: _visibleTelemetryRows,
          sortColumnIndex: _tableSortColumnIndex,
          sortAscending: _tableSortAscending,
          selectedRowId: _selectedTelemetryRowId,
          visibleSections: switch (_activePage) {
            DemoPage.pagination => const <String>{'pagination'},
            DemoPage.dataTable => const <String>{'data-table'},
            _ => null,
          },
          onPageChanged: (int value) {
            setState(() {
              _currentDataPage = value;
              _status = 'Viewing page $value of $_totalDataPages.';
            });
          },
          onSortChanged: (int columnIndex, bool ascending) {
            setState(() {
              _tableSortColumnIndex = columnIndex;
              _tableSortAscending = ascending;
              _currentDataPage = 1;
              _status =
                  'Table sorted by ${_NavigationPage.sortLabel(columnIndex)} '
                  '${ascending ? 'ascending' : 'descending'}.';
            });
          },
          onRowSelected: (_TelemetryRecord row) {
            setState(() {
              _selectedTelemetryRowId = row.id;
              _status =
                  'Selected ${row.node} at ${row.throughput}% throughput.';
            });
          },
        );
      case DemoPage.breadcrumbs:
        return _BreadcrumbsPage(
          page: _activePage,
          path: _breadcrumbPath,
          richCurrentIndex: _richBreadcrumbIndex,
          visibleSections: const <String>{
            'breadcrumbs-basic',
            'breadcrumbs-rich',
          },
          onStepSelected: (int index) {
            setState(() {
              _breadcrumbPath = _breadcrumbPath.sublist(0, index + 1);
              _status = 'Path: ${_breadcrumbPath.join(' / ')}';
            });
          },
          onRichStepSelected: (int index) {
            setState(() {
              _richBreadcrumbIndex = index;
              _status = 'Rich route step selected: ${index + 1}';
            });
          },
          onResetPath: () {
            setState(() {
              _breadcrumbPath = List<String>.from(_defaultBreadcrumbPath);
              _richBreadcrumbIndex = 2;
              _status = 'Path reset: ${_breadcrumbPath.join(' / ')}';
            });
          },
        );
      case DemoPage.button:
      case DemoPage.toast:
      case DemoPage.modal:
      case DemoPage.snackbar:
      case DemoPage.progressIndicator:
      case DemoPage.tooltip:
        return _FeedbackPage(
          page: _activePage,
          buttonEnabled: _buttonEnabled,
          selectedSignal: _selectedSignal,
          sliderValue: _sliderValue,
          visibleSections: switch (_activePage) {
            DemoPage.button => const <String>{'button-toast'},
            DemoPage.toast => const <String>{'button-toast'},
            DemoPage.modal => const <String>{'modal'},
            DemoPage.snackbar => const <String>{'snackbar'},
            DemoPage.progressIndicator => const <String>{'progress-indicator'},
            DemoPage.tooltip => const <String>{'tooltip'},
            _ => null,
          },
          onEnabledChanged: (bool value) {
            setState(() {
              _buttonEnabled = value;
              _status = value
                  ? 'Action buttons enabled.'
                  : 'Action buttons paused.';
            });
          },
          onVector: () {
            setState(() {
              _status = 'Vector confirmed.';
            });
          },
          onModalConfirmed: () {
            setState(() {
              _status = 'Modal confirmed.';
            });
          },
          onSnackbarAction: () {
            setState(() {
              _status = 'Snackbar action triggered.';
            });
          },
          onPulse: () {
            setState(() {
              _status = 'Relay pulse sent.';
            });
          },
        );
      case DemoPage.chips:
        return _ChipsPage(
          page: _activePage,
          selectedFilters: _selectedChipFilters,
          inputChips: _inputChips,
          visibleSections: const <String>{'chips-filter', 'chips-input'},
          onFiltersChanged: (List<String> values) {
            setState(() {
              _selectedChipFilters = values;
              _status = values.isEmpty
                  ? 'No filter chips selected.'
                  : 'Filters: ${values.join(', ')}';
            });
          },
          onInputChipsChanged: (List<String> values) {
            setState(() {
              _inputChips = values;
              _status = values.isEmpty
                  ? 'No input chips set.'
                  : 'Input chips: ${values.join(', ')}';
            });
          },
        );
      case DemoPage.accordion:
        return _AccordionPage(
          page: _activePage,
          expandedIndex: _expandedAccordionIndex,
          visibleSections: const <String>{
            'accordion-basic',
            'accordion-disabled',
          },
          onChanged: (int? value) {
            setState(() {
              _expandedAccordionIndex = value;
              _status = value == null
                  ? 'Accordion collapsed.'
                  : 'Accordion expanded: section ${value + 1}.';
            });
          },
        );
      case DemoPage.datePicker:
      case DemoPage.timePicker:
        return _DateTimePage(
          page: _activePage,
          selectedDate: _selectedDate,
          selectedTime: _selectedTime,
          visibleSections: switch (_activePage) {
            DemoPage.datePicker => const <String>{
              'date-picker-basic',
              'date-picker-bounded',
            },
            DemoPage.timePicker => const <String>{
              'time-picker-24',
              'time-picker-12',
            },
            _ => null,
          },
          onDateChanged: (DateTime value) {
            setState(() {
              _selectedDate = value;
              _status = 'Date selected: ${_formatDate(value)}';
            });
          },
          onTimeChanged: (TimeOfDay value) {
            setState(() {
              _selectedTime = value;
              _status = 'Time selected: ${_formatTime(value)}';
            });
          },
        );
      case DemoPage.card:
      case DemoPage.surface:
        return _SurfacesPage(
          page: _activePage,
          insetContainer: _insetContainer,
          visibleSections: switch (_activePage) {
            DemoPage.card => const <String>{'card'},
            DemoPage.surface => const <String>{'surface'},
            _ => null,
          },
          onInsetChanged: (bool value) {
            setState(() {
              _insetContainer = value;
              _status = value
                  ? 'Inset surface preview enabled.'
                  : 'Raised surface preview enabled.';
            });
          },
        );
      case DemoPage.badge:
        return _BadgePage(
          page: _activePage,
          visibleSections: const <String>{
            'badge-default',
            'badge-tone',
            'badge-color-source',
            'badge-length',
          },
        );
      case DemoPage.inlineBanner:
        return _InlineBannerPage(
          page: _activePage,
          visibleSections: const <String>{
            'inline-banner-default',
            'inline-banner-action',
          },
        );
    }
  }
}
