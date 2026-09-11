part of 'main.dart';

enum DemoPage {
  textField('Text Field'),
  slider('Slider'),
  rangeSlider('Range Slider'),
  checkbox('Checkbox'),
  switchControl('Switch'),
  tabBar('Tab Bar'),
  breadcrumbs('Breadcrumbs'),
  radioGroup('Radio Group'),
  select('Select'),
  datePicker('Date Picker'),
  timePicker('Time Picker'),
  chips('Chips'),
  button('Button'),
  toast('Toast'),
  modal('Modal'),
  snackbar('Snackbar'),
  progressIndicator('Progress Indicator'),
  tooltip('Tooltip'),
  pagination('Pagination'),
  dataTable('Data Table'),
  accordion('Accordion'),
  card('Card'),
  surface('Surface'),
  badge('Badge'),
  inlineBanner('Inline Banner');

  const DemoPage(this.label);
  final String label;
}

final class _DemoPageMeta {
  const _DemoPageMeta({
    required this.section,
    required this.description,
    required this.selector,
    required this.widgetClass,
    required this.category,
    required this.status,
    required this.exampleCount,
    required this.tags,
  });

  final String section;
  final String description;
  final String selector;
  final String widgetClass;
  final String category;
  final String status;
  final int exampleCount;
  final List<String> tags;
}

const Map<DemoPage, _DemoPageMeta> _demoPageMeta = <DemoPage, _DemoPageMeta>{
  DemoPage.textField: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Campo de texto con variantes de estado, contenido y lectura.',
    selector: 'fd-ui-text-field',
    widgetClass: 'FadingTextField',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['input', 'form', 'text'],
  ),
  DemoPage.slider: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Control de rango para valores continuos con feedback visual.',
    selector: 'fd-ui-slider',
    widgetClass: 'FadingSlider',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['input', 'range', 'control'],
  ),
  DemoPage.rangeSlider: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Control de intervalo con dos limites y feedback visual.',
    selector: 'fd-ui-range-slider',
    widgetClass: 'FadingRangeSlider',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 1,
    tags: <String>['input', 'range', 'control'],
  ),
  DemoPage.checkbox: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Seleccion booleana para activacion puntual de opciones.',
    selector: 'fd-ui-checkbox',
    widgetClass: 'FadingCheckbox',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['selection', 'checkbox', 'boolean'],
  ),
  DemoPage.switchControl: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Interruptor para alternar estados on/off en procesos.',
    selector: 'fd-ui-switch',
    widgetClass: 'FadingSwitch',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['selection', 'switch', 'toggle'],
  ),
  DemoPage.tabBar: _DemoPageMeta(
    section: 'NAVEGACION',
    description: 'Navegacion segmentada entre vistas hermanas.',
    selector: 'fd-ui-tab-bar',
    widgetClass: 'FadingTabBar',
    category: 'Navegacion',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['navigation', 'tabs', 'selection'],
  ),
  DemoPage.breadcrumbs: _DemoPageMeta(
    section: 'NAVEGACION',
    description: 'Ruta de navegacion jerarquica para volver a niveles previos.',
    selector: 'fd-ui-breadcrumbs',
    widgetClass: 'FadingBreadcrumbs',
    category: 'Navegacion',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['navigation', 'breadcrumbs', 'path'],
  ),
  DemoPage.radioGroup: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Seleccion unica entre opciones mutuamente excluyentes.',
    selector: 'fd-ui-radio-group',
    widgetClass: 'FadingRadioGroup',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['selection', 'radio', 'single'],
  ),
  DemoPage.select: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Dropdown con variantes single y multi segun props.',
    selector: 'fd-ui-select',
    widgetClass: 'FadingSelect',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['dropdown', 'select', 'single', 'multi'],
  ),
  DemoPage.datePicker: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Seleccion de fecha con rango abierto o acotado.',
    selector: 'fd-ui-date-picker',
    widgetClass: 'FadingDatePicker',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['date', 'picker', 'calendar'],
  ),
  DemoPage.timePicker: _DemoPageMeta(
    section: 'FORMULARIOS',
    description: 'Seleccion de hora con formatos 24h y 12h.',
    selector: 'fd-ui-time-picker',
    widgetClass: 'FadingTimePicker',
    category: 'Formularios',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['time', 'picker', '12h', '24h'],
  ),
  DemoPage.chips: _DemoPageMeta(
    section: 'ACCIONES',
    description: 'Chips de filtro y de entrada libre con props dedicadas.',
    selector: 'fd-ui-chips',
    widgetClass: 'FadingChips',
    category: 'Acciones',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['chips', 'filter', 'input'],
  ),
  DemoPage.button: _DemoPageMeta(
    section: 'ACCIONES',
    description: 'Boton principal con estados enabled y disabled.',
    selector: 'fd-ui-button',
    widgetClass: 'FadingButton',
    category: 'Acciones',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['button', 'action'],
  ),
  DemoPage.toast: _DemoPageMeta(
    section: 'ACCIONES',
    description: 'Notificacion transient disparada por acciones.',
    selector: 'fd-ui-toast',
    widgetClass: 'FadingToast',
    category: 'Acciones',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['toast', 'feedback'],
  ),
  DemoPage.modal: _DemoPageMeta(
    section: 'ACCIONES',
    description: 'Dialogos de confirmacion con acciones configurables.',
    selector: 'fd-ui-modal',
    widgetClass: 'FadingModal',
    category: 'Acciones',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['modal', 'dialog', 'confirm'],
  ),
  DemoPage.snackbar: _DemoPageMeta(
    section: 'ACCIONES',
    description: 'Avisos inferiores con accion secundaria opcional.',
    selector: 'fd-ui-snackbar',
    widgetClass: 'FadingSnackbar',
    category: 'Acciones',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['snackbar', 'notification'],
  ),
  DemoPage.progressIndicator: _DemoPageMeta(
    section: 'ACCIONES',
    description: 'Indicadores de progreso lineal y circular.',
    selector: 'fd-ui-progress-indicator',
    widgetClass: 'FadingProgressIndicator',
    category: 'Acciones',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['progress', 'status', 'circular', 'linear'],
  ),
  // DemoPage.tooltip: _DemoPageMeta(
  //   section: 'ACCIONES',
  //   description: 'Ayuda contextual en hover, focus y long-press.',
  //   selector: 'fd-ui-tooltip',
  //   widgetClass: 'FadingTooltip',
  //   category: 'Acciones',
  //   status: 'STABLE',
  //   exampleCount: 2,
  //   tags: <String>['tooltip', 'assistive', 'overlay'],
  // ),
  DemoPage.pagination: _DemoPageMeta(
    section: 'NAVEGACION',
    description: 'Navegacion por bloques de resultados.',
    selector: 'fd-ui-pagination',
    widgetClass: 'FadingPagination',
    category: 'Navegacion',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['pagination', 'navigation', 'data'],
  ),
  DemoPage.dataTable: _DemoPageMeta(
    section: 'NAVEGACION',
    description: 'Tabla con sort y seleccion por filas.',
    selector: 'fd-ui-data-table',
    widgetClass: 'FadingDataTable',
    category: 'Navegacion',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['table', 'data', 'sorting'],
  ),
  DemoPage.accordion: _DemoPageMeta(
    section: 'SUPERFICIES',
    description: 'Bloques expandibles con items habilitados y deshabilitados.',
    selector: 'fd-ui-accordion',
    widgetClass: 'FadingAccordion',
    category: 'Superficies',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['accordion', 'expand', 'collapse'],
  ),
  DemoPage.card: _DemoPageMeta(
    section: 'SUPERFICIES',
    description: 'Contenedor elevado para jerarquia de contenido.',
    selector: 'fd-ui-card',
    widgetClass: 'FadingCard',
    category: 'Superficies',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['card', 'surface', 'container'],
  ),
  DemoPage.surface: _DemoPageMeta(
    section: 'SUPERFICIES',
    description: 'Superficie base raised/inset para layout de bloques.',
    selector: 'fd-ui-surface',
    widgetClass: 'FadingSurface',
    category: 'Superficies',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['surface', 'raised', 'inset'],
  ),
  DemoPage.badge: _DemoPageMeta(
    section: 'SUPERFICIES',
    description: 'Etiqueta compacta para estados, categorias y conteos.',
    selector: 'fd-ui-badge',
    widgetClass: 'FadingBadge',
    category: 'Superficies',
    status: 'STABLE',
    exampleCount: 3,
    tags: <String>['badge', 'status', 'label'],
  ),
  DemoPage.inlineBanner: _DemoPageMeta(
    section: 'SUPERFICIES',
    description:
        'Aviso inline para mensajes contextuales dentro de contenido y formularios.',
    selector: 'fd-ui-inline-banner',
    widgetClass: 'FadingInlineBanner',
    category: 'Superficies',
    status: 'STABLE',
    exampleCount: 2,
    tags: <String>['banner', 'inline', 'status', 'alert'],
  ),
};

_DemoPageMeta _docsMetaFor(DemoPage page) {
  return _demoPageMeta[page]!;
}

Map<String, List<DemoPage>> _pagesBySection() {
  final Map<String, List<DemoPage>> grouped = <String, List<DemoPage>>{};
  for (final DemoPage page in _demoPageMeta.keys) {
    final String section = _docsMetaFor(page).section;
    grouped.putIfAbsent(section, () => <DemoPage>[]).add(page);
  }
  return grouped;
}

String _formatDate(DateTime value) {
  const List<String> monthNames = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${monthNames[value.month - 1]} ${value.day}, ${value.year}';
}

String _formatTime(TimeOfDay value, {bool use24HourFormat = true}) {
  final String minute = value.minute.toString().padLeft(2, '0');
  if (use24HourFormat) {
    return '${value.hour.toString().padLeft(2, '0')}:$minute';
  }

  final int hour = value.hourOfPeriod == 0 ? 12 : value.hourOfPeriod;
  final String suffix = value.period.name.toUpperCase();
  return '$hour:$minute $suffix';
}

List<BoxShadow> _raisedShadows(FadingThemeData theme) {
  return <BoxShadow>[
    BoxShadow(
      color: theme.shadowDark,
      offset: const Offset(8, 8),
      blurRadius: 18,
    ),
    BoxShadow(
      color: theme.shadowLight,
      offset: const Offset(-5.6, -5.6),
      blurRadius: 18,
    ),
  ];
}

List<BoxShadow> _insetShadows(FadingThemeData theme) {
  return <BoxShadow>[
    BoxShadow(
      color: theme.insetShadowDark,
      offset: const Offset(4, 4),
      blurRadius: 12,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: theme.insetShadowLight,
      offset: const Offset(-2, -2),
      blurRadius: 5,
      spreadRadius: -2,
    ),
  ];
}
