part of 'main.dart';

class _InputsPage extends StatelessWidget {
  const _InputsPage({
    required this.page,
    required this.signal,
    required this.sliderValue,
    required this.onSignalChanged,
    required this.onSliderChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final String signal;
  final double sliderValue;
  final ValueChanged<String> onSignalChanged;
  final ValueChanged<double> onSliderChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingTextField',
          sectionId: 'text-field',
          visibleSections: visibleSections,
          summary:
              'Campo de texto con etiqueta flotante y feedback inmediato del valor ingresado.',
          tags: const <String>['input', 'form', 'text'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingTextField(
                label: 'Transmission',
                hint: 'Enter a house command',
                onChanged: onSignalChanged,
              ),
              const SizedBox(height: 10),
              Text(
                signal.isEmpty ? 'Awaiting signal...' : 'Signal: $signal',
                style: theme.bodyMedium.copyWith(color: theme.accentStrong),
              ),
            ],
          ),
          code: '''FadingTextField(
  label: 'Transmission',
  hint: 'Enter a house command',
  onChanged: (String value) {
    setState(() {
      _signal = value;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingSlider',
          sectionId: 'slider',
          visibleSections: visibleSections,
          summary:
              'Control de rango continuo para ajustar intensidad con respuesta visual clara.',
          tags: const <String>['input', 'range', 'control'],
          preview: FadingSlider(
            label: 'Drive intensity',
            min: 0,
            max: 100,
            value: sliderValue,
            onChanged: onSliderChanged,
          ),
          code: '''FadingSlider(
  label: 'Drive intensity',
  min: 0,
  max: 100,
  value: _sliderValue,
  onChanged: (double value) {
    setState(() {
      _sliderValue = value;
    });
  },
)''',
        ),
      ],
    );
  }
}

class _RangeSliderPage extends StatelessWidget {
  const _RangeSliderPage({
    required this.page,
    required this.startValue,
    required this.endValue,
    required this.onChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final double startValue;
  final double endValue;
  final ValueChanged<RangeValues> onChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingRangeSlider',
          sectionId: 'range-slider',
          visibleSections: visibleSections,
          summary:
              'Control de intervalo para definir limites minimos y maximos con respuesta visual clara.',
          tags: const <String>['input', 'range', 'control'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingRangeSlider(
                label: 'Telemetry range',
                min: 0,
                max: 100,
                startValue: startValue,
                endValue: endValue,
                onChanged: onChanged,
              ),
              const SizedBox(height: 10),
              Text(
                'Selected range: ${startValue.round()}% - ${endValue.round()}%',
                style: theme.bodyMedium.copyWith(color: theme.accentStrong),
              ),
            ],
          ),
          code: '''FadingRangeSlider(
  label: 'Telemetry range',
  min: 0,
  max: 100,
  startValue: _rangeSliderStart,
  endValue: _rangeSliderEnd,
  onChanged: (RangeValues value) {
    setState(() {
      _rangeSliderStart = value.start;
      _rangeSliderEnd = value.end;
    });
  },
)''',
        ),
      ],
    );
  }
}

class _SelectionPage extends StatelessWidget {
  const _SelectionPage({
    required this.page,
    required this.checkboxValue,
    required this.switchValue,
    required this.selectedSignal,
    required this.selectedChannel,
    required this.selectedChannels,
    required this.selectedTab,
    required this.tabLabels,
    required this.onCheckboxChanged,
    required this.onSwitchChanged,
    required this.onTabChanged,
    required this.onRadioChanged,
    required this.onSingleSelectChanged,
    required this.onSelectChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final bool checkboxValue;
  final bool switchValue;
  final String selectedSignal;
  final String selectedChannel;
  final List<String> selectedChannels;
  final int selectedTab;
  final List<String> tabLabels;
  final ValueChanged<bool> onCheckboxChanged;
  final ValueChanged<bool> onSwitchChanged;
  final ValueChanged<int> onTabChanged;
  final ValueChanged<String> onRadioChanged;
  final ValueChanged<String?> onSingleSelectChanged;
  final ValueChanged<List<String>> onSelectChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingCheckbox + FadingSwitch',
          sectionId: 'checkbox-switch',
          visibleSections: visibleSections,
          summary:
              'Controles booleanos para activar estados puntuales y conmutar opciones operativas.',
          tags: const <String>['selection', 'checkbox', 'switch'],
          preview: Column(
            children: <Widget>[
              FadingCheckbox(
                label: 'Enable pulse lock',
                value: checkboxValue,
                onChanged: onCheckboxChanged,
              ),
              const SizedBox(height: 10),
              FadingSwitch(
                label: 'Aux relay',
                value: switchValue,
                onChanged: onSwitchChanged,
              ),
            ],
          ),
          code: '''FadingCheckbox(
  label: 'Enable pulse lock',
  value: _checkboxValue,
  onChanged: (bool value) {
    setState(() {
      _checkboxValue = value;
    });
  },
)

FadingSwitch(
  label: 'Aux relay',
  value: _switchValue,
  onChanged: (bool value) {
    setState(() {
      _switchValue = value;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingTabBar',
          sectionId: 'tab-bar',
          visibleSections: visibleSections,
          summary:
              'Navegacion segmentada para alternar vistas relacionadas dentro del mismo contexto.',
          tags: const <String>['selection', 'tabs', 'navigation'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingTabBar(
                tabs: tabLabels,
                selectedIndex: selectedTab,
                onChanged: onTabChanged,
              ),
              const SizedBox(height: 8),
              Text(
                'Active view: ${tabLabels[selectedTab]}',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingTabBar(
  tabs: const <String>['Signals', 'Telemetry', 'Archive'],
  selectedIndex: _selectedTab,
  onChanged: (int index) {
    setState(() {
      _selectedTab = index;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingRadioGroup',
          sectionId: 'radio-group',
          visibleSections: visibleSections,
          summary:
              'Seleccion unica entre opciones mutuamente excluyentes con texto descriptivo.',
          tags: const <String>['selection', 'radio', 'single choice'],
          preview: FadingRadioGroup<String>(
            label: 'Broadcast channel',
            value: selectedSignal,
            onChanged: onRadioChanged,
            options: const <FadingRadioOption<String>>[
              FadingRadioOption<String>(
                value: 'Alpha',
                label: 'Alpha - Near field',
              ),
              FadingRadioOption<String>(
                value: 'Beta',
                label: 'Beta - Relay mesh',
              ),
              FadingRadioOption<String>(
                value: 'Gamma',
                label: 'Gamma - Deep route',
              ),
            ],
          ),
          code: '''FadingRadioGroup<String>(
  label: 'Broadcast channel',
  value: _selectedSignal,
  onChanged: (String value) {
    setState(() {
      _selectedSignal = value;
    });
  },
  options: const <FadingRadioOption<String>>[
    FadingRadioOption(value: 'Alpha', label: 'Alpha - Near field'),
    FadingRadioOption(value: 'Beta', label: 'Beta - Relay mesh'),
    FadingRadioOption(value: 'Gamma', label: 'Gamma - Deep route'),
  ],
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingSelect (Single)',
          sectionId: 'select-single',
          visibleSections: visibleSections,
          summary:
              'Dropdown de seleccion unica para elegir un canal principal de manera compacta.',
          tags: const <String>['selection', 'select', 'single'],
          preview: FadingSelect<String>.single(
            label: 'Primary dispatch channel',
            value: selectedChannel,
            onValueChanged: onSingleSelectChanged,
            options: const <FadingSelectOption<String>>[
              FadingSelectOption<String>(
                value: 'Alpha',
                label: 'Alpha - Near field',
              ),
              FadingSelectOption<String>(
                value: 'Beta',
                label: 'Beta - Relay mesh',
              ),
              FadingSelectOption<String>(
                value: 'Gamma',
                label: 'Gamma - Deep route',
              ),
              FadingSelectOption<String>(
                value: 'Delta',
                label: 'Delta - Orbital lock',
              ),
            ],
          ),
          code: '''FadingSelect<String>.single(
  label: 'Primary dispatch channel',
  value: _selectedChannel,
  onValueChanged: (String? value) {
    setState(() {
      _selectedChannel = value ?? _selectedChannel;
    });
  },
  options: const <FadingSelectOption<String>>[
    FadingSelectOption(value: 'Alpha', label: 'Alpha - Near field'),
    FadingSelectOption(value: 'Beta', label: 'Beta - Relay mesh'),
    FadingSelectOption(value: 'Gamma', label: 'Gamma - Deep route'),
    FadingSelectOption(value: 'Delta', label: 'Delta - Orbital lock'),
  ],
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingMultiSelect',
          sectionId: 'select-multi',
          visibleSections: visibleSections,
          summary:
              'Selector multiseleccion para combinar canales y construir filtros compuestos.',
          tags: const <String>['selection', 'multi-select', 'filters'],
          preview: FadingMultiSelect<String>(
            label: 'Dispatch channels',
            values: selectedChannels,
            onChanged: onSelectChanged,
            options: const <FadingMultiSelectOption<String>>[
              FadingMultiSelectOption<String>(
                value: 'Alpha',
                label: 'Alpha - Near field',
              ),
              FadingMultiSelectOption<String>(
                value: 'Beta',
                label: 'Beta - Relay mesh',
              ),
              FadingMultiSelectOption<String>(
                value: 'Gamma',
                label: 'Gamma - Deep route',
              ),
              FadingMultiSelectOption<String>(
                value: 'Delta',
                label: 'Delta - Orbital lock',
              ),
            ],
          ),
          code: '''FadingMultiSelect<String>(
  label: 'Dispatch channels',
  values: _selectedChannels,
  onChanged: (List<String> values) {
    setState(() {
      _selectedChannels = values;
    });
  },
  options: const <FadingMultiSelectOption<String>>[
    FadingMultiSelectOption(value: 'Alpha', label: 'Alpha - Near field'),
    FadingMultiSelectOption(value: 'Beta', label: 'Beta - Relay mesh'),
    FadingMultiSelectOption(value: 'Gamma', label: 'Gamma - Deep route'),
    FadingMultiSelectOption(value: 'Delta', label: 'Delta - Orbital lock'),
  ],
)''',
        ),
      ],
    );
  }
}

class _FeedbackPage extends StatelessWidget {
  const _FeedbackPage({
    required this.page,
    required this.buttonEnabled,
    required this.selectedSignal,
    required this.sliderValue,
    required this.onEnabledChanged,
    required this.onVector,
    required this.onModalConfirmed,
    required this.onSnackbarAction,
    required this.onPulse,
    this.visibleSections,
  });

  final DemoPage page;
  final bool buttonEnabled;
  final String selectedSignal;
  final double sliderValue;
  final ValueChanged<bool> onEnabledChanged;
  final VoidCallback onVector;
  final VoidCallback onModalConfirmed;
  final VoidCallback onSnackbarAction;
  final VoidCallback onPulse;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingButton + FadingToast',
          sectionId: 'button-toast',
          visibleSections: visibleSections,
          summary:
              'Acciones principales con feedback inmediato por toast para confirmar operaciones.',
          tags: const <String>['feedback', 'button', 'toast'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  FadingButton(
                    label: 'Engage Vector',
                    enabled: buttonEnabled,
                    onPressed: () {
                      onVector();
                      FadingToast.show(context, message: 'Vector confirmed.');
                    },
                  ),
                  FadingButton(
                    label: 'Pulse Relay',
                    enabled: buttonEnabled,
                    onPressed: () {
                      onPulse();
                      FadingToast.show(context, message: 'Relay pulse sent.');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FadingCheckbox(
                label: 'Buttons enabled',
                value: buttonEnabled,
                onChanged: onEnabledChanged,
              ),
            ],
          ),
          code: '''FadingButton(
  label: 'Engage Vector',
  enabled: _buttonEnabled,
  onPressed: () {
    FadingToast.show(context, message: 'Vector confirmed.');
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingModal',
          sectionId: 'modal',
          visibleSections: visibleSections,
          summary:
              'Dialogo modal para confirmaciones criticas con acciones primarias y secundarias.',
          tags: const <String>['feedback', 'modal', 'dialog'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingButton(
                label: 'Open Modal',
                enabled: buttonEnabled,
                onPressed: () {
                  FadingModal.show(
                    context,
                    title: 'Confirm signal',
                    body: Text(
                      'Dispatch the current $selectedSignal command set?',
                    ),
                    actions: <FadingModalAction>[
                      const FadingModalAction(label: 'Cancel'),
                      FadingModalAction(
                        label: 'Confirm',
                        onPressed: onModalConfirmed,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Reusable dialog shell with backdrop, body, and actions.',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingModal.show(
  context,
  title: 'Confirm signal',
  body: Text('Dispatch the current command set?'),
  actions: <FadingModalAction>[
    const FadingModalAction(label: 'Cancel'),
    FadingModalAction(label: 'Confirm', onPressed: _onConfirm),
  ],
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingSnackbar',
          sectionId: 'snackbar',
          visibleSections: visibleSections,
          summary:
              'Notificacion contextual en la parte inferior con accion opcional de reversa.',
          tags: const <String>['feedback', 'snackbar', 'notification'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingButton(
                label: 'Show Snackbar',
                enabled: buttonEnabled,
                onPressed: () {
                  FadingSnackbar.show(
                    context,
                    message: 'Telemetry route updated.',
                    action: FadingSnackbarAction(
                      label: 'Undo',
                      onPressed: onSnackbarAction,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Bottom notification with a persistent action button.',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingSnackbar.show(
  context,
  message: 'Telemetry route updated.',
  action: FadingSnackbarAction(
    label: 'Undo',
    onPressed: _onUndo,
  ),
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingProgressIndicator',
          sectionId: 'progress-indicator',
          visibleSections: visibleSections,
          summary:
              'Indicadores lineal y circular para comunicar progreso de tareas en tiempo real.',
          tags: const <String>['feedback', 'progress', 'status'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingProgressIndicator(
                label: 'Linear sync',
                value: sliderValue / 100,
              ),
              const SizedBox(height: 12),
              Row(
                children: <Widget>[
                  FadingProgressIndicator(
                    label: 'Orbital sync',
                    value: sliderValue / 100,
                    variant: FadingProgressVariant.circular,
                    size: 84,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Channel $selectedSignal at ${sliderValue.round()}% power.',
                      style: theme.bodyMedium.copyWith(color: theme.textMuted),
                    ),
                  ),
                ],
              ),
            ],
          ),
          code: '''FadingProgressIndicator(
  label: 'Linear sync',
  value: _sliderValue / 100,
)

FadingProgressIndicator(
  label: 'Orbital sync',
  value: _sliderValue / 100,
  variant: FadingProgressVariant.circular,
  size: 84,
)''',
        ),
        //         const SizedBox(height: 14),
        //         _ShowcaseSection(
        //           title: 'FadingTooltip',
        //           sectionId: 'tooltip',
        //           visibleSections: visibleSections,
        //           summary:
        //               'Ayuda contextual en hover, foco o long-press para explicar acciones y estados.',
        //           tags: const <String>['feedback', 'tooltip', 'assistive'],
        //           preview: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               Wrap(
        //                 spacing: 12,
        //                 runSpacing: 12,
        //                 children: <Widget>[
        //                   FadingTooltip(
        //                     message: 'Telemetry uplink is stable.',
        //                     child: FadingSurface(
        //                       padding: const EdgeInsets.symmetric(
        //                         horizontal: 14,
        //                         vertical: 10,
        //                       ),
        //                       child: Text(
        //                         'Hover or long-press me',
        //                         style: theme.labelLarge,
        //                       ),
        //                     ),
        //                   ),
        //                   FadingTooltip(
        //                     message: 'Critical command path.',
        //                     preferBelow: false,
        //                     child: FadingSurface(
        //                       style: FadingSurfaceStyle.inset,
        //                       padding: const EdgeInsets.symmetric(
        //                         horizontal: 14,
        //                         vertical: 10,
        //                       ),
        //                       child: Text('Tooltip above', style: theme.labelLarge),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(height: 10),
        //               Text(
        //                 'Supports hover, focus, and long-press triggers.',
        //                 style: theme.bodyMedium.copyWith(color: theme.textMuted),
        //               ),
        //             ],
        //           ),
        //           code: '''FadingTooltip(
        //   message: 'Telemetry uplink is stable.',
        //   child: FadingSurface(
        //     child: Text('Hover or long-press me'),
        //   ),
        // )''',
        //         ),
      ],
    );
  }
}

class _ChipsPage extends StatelessWidget {
  const _ChipsPage({
    required this.page,
    required this.selectedFilters,
    required this.inputChips,
    required this.onFiltersChanged,
    required this.onInputChipsChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final List<String> selectedFilters;
  final List<String> inputChips;
  final ValueChanged<List<String>> onFiltersChanged;
  final ValueChanged<List<String>> onInputChipsChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingChips (Filter)',
          sectionId: 'chips-filter',
          visibleSections: visibleSections,
          summary:
              'Conjunto de chips seleccionables para filtrar resultados por multiples criterios.',
          tags: const <String>['chips', 'filter', 'multi-select'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingChips(
                label: 'Signal filters',
                values: selectedFilters,
                onChanged: onFiltersChanged,
                options: const <FadingChipsOption>[
                  FadingChipsOption(value: 'Alpha', label: 'Alpha'),
                  FadingChipsOption(value: 'Beta', label: 'Beta'),
                  FadingChipsOption(value: 'Gamma', label: 'Gamma'),
                  FadingChipsOption(value: 'Delta', label: 'Delta'),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                selectedFilters.isEmpty
                    ? 'No filters selected.'
                    : 'Active filters: ${selectedFilters.join(', ')}',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingChips(
  label: 'Signal filters',
  values: _selectedChipFilters,
  onChanged: (List<String> values) {
    setState(() {
      _selectedChipFilters = values;
    });
  },
  options: const <FadingChipsOption>[
    FadingChipsOption(value: 'Alpha', label: 'Alpha'),
    FadingChipsOption(value: 'Beta', label: 'Beta'),
    FadingChipsOption(value: 'Gamma', label: 'Gamma'),
    FadingChipsOption(value: 'Delta', label: 'Delta'),
  ],
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingChips (Input)',
          sectionId: 'chips-input',
          visibleSections: visibleSections,
          summary:
              'Entrada libre de etiquetas para capturar terminos rapidos en formato chip.',
          tags: const <String>['chips', 'input', 'tags'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingChips(
                label: 'Input chips',
                hint: 'Type and press Enter or comma',
                values: inputChips,
                onChanged: onInputChipsChanged,
              ),
              const SizedBox(height: 8),
              Text(
                inputChips.isEmpty
                    ? 'No input chips.'
                    : 'Current chips: ${inputChips.join(', ')}',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingChips(
  label: 'Input chips',
  hint: 'Type and press Enter or comma',
  values: _inputChips,
  onChanged: (List<String> values) {
    setState(() {
      _inputChips = values;
    });
  },
)''',
        ),
      ],
    );
  }
}

class _DateTimePage extends StatelessWidget {
  const _DateTimePage({
    required this.page,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingDatePicker',
          sectionId: 'date-picker-basic',
          visibleSections: visibleSections,
          summary:
              'Selector de fecha para agendar eventos con interaccion de calendario emergente.',
          tags: const <String>['date', 'picker', 'form'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingDatePicker(
                label: 'Mission date',
                selectedDate: selectedDate,
                onChanged: onDateChanged,
              ),
              const SizedBox(height: 10),
              Text(
                'Selected: ${_formatDate(selectedDate)}',
                style: theme.bodyMedium.copyWith(color: theme.accentStrong),
              ),
            ],
          ),
          code: '''FadingDatePicker(
  label: 'Mission date',
  selectedDate: _selectedDate,
  onChanged: (DateTime value) {
    setState(() {
      _selectedDate = value;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingDatePicker (Bounded Range)',
          sectionId: 'date-picker-bounded',
          visibleSections: visibleSections,
          summary:
              'Variante con rango acotado para limitar selecciones a una ventana valida.',
          tags: const <String>['date', 'picker', 'constraints'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingDatePicker(
                label: 'Launch window',
                selectedDate: selectedDate,
                firstDate: DateTime(2026, 6, 10),
                lastDate: DateTime(2026, 7, 20),
                onChanged: onDateChanged,
              ),
              const SizedBox(height: 10),
              Text(
                'Window: Jun 10, 2026 - Jul 20, 2026',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingDatePicker(
  label: 'Launch window',
  selectedDate: _selectedDate,
  firstDate: DateTime(2026, 6, 10),
  lastDate: DateTime(2026, 7, 20),
  onChanged: (DateTime value) {
    setState(() {
      _selectedDate = value;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingTimePicker (24-Hour)',
          sectionId: 'time-picker-24',
          visibleSections: visibleSections,
          summary:
              'Selector de hora en formato 24h para flujos tecnicos o operativos.',
          tags: const <String>['time', 'picker', '24h'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 360,
                child: FadingTimePicker(
                  label: 'Launch time',
                  selectedTime: selectedTime,
                  onChanged: onTimeChanged,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selected: ${_formatTime(selectedTime)}',
                style: theme.bodyMedium.copyWith(color: theme.accentStrong),
              ),
            ],
          ),
          code: '''FadingTimePicker(
  label: 'Launch time',
  selectedTime: _selectedTime,
  onChanged: (TimeOfDay value) {
    setState(() {
      _selectedTime = value;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingTimePicker (12-Hour)',
          sectionId: 'time-picker-12',
          visibleSections: visibleSections,
          summary:
              'Selector de hora con AM/PM para experiencias orientadas a usuario general.',
          tags: const <String>['time', 'picker', '12h'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 360,
                child: FadingTimePicker(
                  label: 'Arrival window',
                  selectedTime: selectedTime,
                  use24HourFormat: false,
                  onChanged: onTimeChanged,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Selected: ${_formatTime(selectedTime, use24HourFormat: false)}',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingTimePicker(
  label: 'Arrival window',
  selectedTime: _selectedTime,
  use24HourFormat: false,
  onChanged: (TimeOfDay value) {
    setState(() {
      _selectedTime = value;
    });
  },
)''',
        ),
      ],
    );
  }
}

class _NavigationPage extends StatelessWidget {
  const _NavigationPage({
    required this.page,
    required this.currentPage,
    required this.totalPages,
    required this.rows,
    required this.sortColumnIndex,
    required this.sortAscending,
    required this.selectedRowId,
    required this.onPageChanged,
    required this.onSortChanged,
    required this.onRowSelected,
    this.visibleSections,
  });

  final DemoPage page;
  final int currentPage;
  final int totalPages;
  final List<_TelemetryRecord> rows;
  final int sortColumnIndex;
  final bool sortAscending;
  final int? selectedRowId;
  final ValueChanged<int> onPageChanged;
  final FadingDataTableSortChanged onSortChanged;
  final ValueChanged<_TelemetryRecord> onRowSelected;
  final Set<String>? visibleSections;

  static String sortLabel(int columnIndex) {
    switch (columnIndex) {
      case 0:
        return 'Node';
      case 1:
        return 'Throughput';
      case 2:
        return 'Status';
      default:
        return 'Node';
    }
  }

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingPagination',
          sectionId: 'pagination',
          visibleSections: visibleSections,
          summary:
              'Control de paginacion para recorrer datasets largos por bloques manejables.',
          tags: const <String>['navigation', 'pagination', 'data'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingPagination(
                label: 'Telemetry pages',
                currentPage: currentPage,
                totalPages: totalPages,
                onPageChanged: onPageChanged,
              ),
              const SizedBox(height: 10),
              Text(
                'Page $currentPage of $totalPages',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingPagination(
  label: 'Telemetry pages',
  currentPage: _currentDataPage,
  totalPages: _totalDataPages,
  onPageChanged: (int page) {
    setState(() {
      _currentDataPage = page;
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingDataTable',
          sectionId: 'data-table',
          visibleSections: visibleSections,
          summary:
              'Tabla de datos con ordenamiento, seleccion de filas y celdas personalizadas.',
          tags: const <String>['navigation', 'table', 'sorting'],
          preview: Builder(
            builder: (BuildContext context) {
              final int selectedRowIndex = rows.indexWhere(
                (_TelemetryRecord row) => row.id == selectedRowId,
              );

              return FadingDataTable<_TelemetryRecord>(
                label: 'Current telemetry page',
                rows: rows,
                sortColumnIndex: sortColumnIndex,
                sortAscending: sortAscending,
                selectedRowIndex: selectedRowIndex < 0
                    ? null
                    : selectedRowIndex,
                onSortChanged: onSortChanged,
                onRowTap: (int _, _TelemetryRecord row) {
                  onRowSelected(row);
                },
                columns: <FadingDataColumn<_TelemetryRecord>>[
                  FadingDataColumn<_TelemetryRecord>(
                    label: 'Node',
                    cellBuilder: (BuildContext context, _TelemetryRecord row) {
                      final FadingThemeData theme = FadingThemeScope.of(
                        context,
                      );
                      return Text(row.node, style: theme.bodyMedium);
                    },
                    sortComparator: (a, b) => a.node.compareTo(b.node),
                    flex: 2,
                  ),
                  FadingDataColumn<_TelemetryRecord>(
                    label: 'Throughput %',
                    numeric: true,
                    cellBuilder: (BuildContext context, _TelemetryRecord row) {
                      final FadingThemeData theme = FadingThemeScope.of(
                        context,
                      );
                      return Text('${row.throughput}', style: theme.bodyMedium);
                    },
                    sortComparator: (a, b) =>
                        a.throughput.compareTo(b.throughput),
                  ),
                  FadingDataColumn<_TelemetryRecord>(
                    label: 'Status',
                    cellBuilder: (BuildContext context, _TelemetryRecord row) {
                      final FadingThemeData theme = FadingThemeScope.of(
                        context,
                      );
                      final Color color = switch (row.status) {
                        'Critical' => theme.error,
                        'Watch' => theme.accent,
                        _ => theme.success,
                      };
                      return Text(
                        row.status,
                        style: theme.bodyMedium.copyWith(color: color),
                      );
                    },
                    sortComparator: (a, b) => a.status.compareTo(b.status),
                  ),
                ],
              );
            },
          ),
          code: '''FadingDataTable<TelemetryRow>(
  label: 'Current telemetry page',
  rows: _visibleTelemetryRows,
  sortColumnIndex: _tableSortColumnIndex,
  sortAscending: _tableSortAscending,
  onSortChanged: (int columnIndex, bool ascending) {
    setState(() {
      _tableSortColumnIndex = columnIndex;
      _tableSortAscending = ascending;
    });
  },
  onRowTap: (int rowIndex, TelemetryRow row) {
    setState(() {
      _selectedTelemetryRowId = row.id;
    });
  },
  columns: <FadingDataColumn<TelemetryRow>>[
    FadingDataColumn(label: 'Node', cellBuilder: (_, row) => Text(row.node)),
    FadingDataColumn(
      label: 'Throughput %',
      numeric: true,
      cellBuilder: (_, row) => Text(row.throughput.toString()),
      sortComparator: (a, b) => a.throughput.compareTo(b.throughput),
    ),
    FadingDataColumn(label: 'Status', cellBuilder: (_, row) => Text(row.status)),
  ],
)''',
        ),
      ],
    );
  }
}

class _TelemetryRecord {
  const _TelemetryRecord(this.id, this.node, this.throughput, this.status);

  final int id;
  final String node;
  final int throughput;
  final String status;
}

class _BreadcrumbsPage extends StatelessWidget {
  const _BreadcrumbsPage({
    required this.page,
    required this.path,
    required this.richCurrentIndex,
    required this.onStepSelected,
    required this.onRichStepSelected,
    required this.onResetPath,
    this.visibleSections,
  });

  final DemoPage page;
  final List<String> path;
  final int richCurrentIndex;
  final ValueChanged<int> onStepSelected;
  final ValueChanged<int> onRichStepSelected;
  final VoidCallback onResetPath;
  final Set<String>? visibleSections;

  static const List<FadingBreadcrumbItem> _richItems = <FadingBreadcrumbItem>[
    FadingBreadcrumbItem(
      label: 'Workspace',
      leading: _CrumbGlyph(label: 'W', color: Color(0xFF2563EB)),
    ),
    FadingBreadcrumbItem(
      label: 'Missions',
      leading: _CrumbGlyph(label: 'M', color: Color(0xFF0EA5E9)),
      enabled: false,
    ),
    FadingBreadcrumbItem(
      label: 'Telemetry',
      leading: _CrumbGlyph(label: 'T', color: Color(0xFF14B8A6)),
    ),
    FadingBreadcrumbItem(
      label: 'Node 7',
      leading: _CrumbGlyph(label: 'N', color: Color(0xFF6366F1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingBreadcrumbs',
          sectionId: 'breadcrumbs-basic',
          visibleSections: visibleSections,
          summary:
              'Navegacion jerarquica para saltar a niveles previos dentro de un flujo.',
          tags: const <String>['navigation', 'breadcrumbs', 'path'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingBreadcrumbs(
                label: 'Current route',
                items: path,
                currentIndex: path.length - 1,
                onChanged: onStepSelected,
              ),
              const SizedBox(height: 10),
              Text(
                'Path: ${path.join(' / ')}',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
              const SizedBox(height: 10),
              FadingButton(label: 'Reset path', onPressed: onResetPath),
            ],
          ),
          code: '''FadingBreadcrumbs(
  label: 'Current route',
  items: _breadcrumbPath,
  currentIndex: _breadcrumbPath.length - 1,
  onChanged: (int index) {
    setState(() {
      _breadcrumbPath = _breadcrumbPath.sublist(0, index + 1);
    });
  },
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingBreadcrumbs (Rich Items)',
          sectionId: 'breadcrumbs-rich',
          visibleSections: visibleSections,
          summary:
              'Version compleja con leading por item, bloqueo puntual y separador personalizado.',
          tags: const <String>[
            'navigation',
            'breadcrumbs',
            'icons',
            'disabled',
          ],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingBreadcrumbs(
                label: 'Mission route',
                items: _richItems,
                currentIndex: richCurrentIndex,
                onChanged: onRichStepSelected,
                separatorBuilder:
                    (BuildContext context, int _, FadingThemeData theme) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          '>',
                          style: theme.bodyMedium.copyWith(
                            color: theme.textMuted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
              ),
              const SizedBox(height: 10),
              Text(
                'Note: Missions is disabled in this example.',
                style: theme.bodyMedium.copyWith(color: theme.textMuted),
              ),
            ],
          ),
          code: '''FadingBreadcrumbs(
  label: 'Mission route',
  items: const <Object>[
    FadingBreadcrumbItem(label: 'Workspace', leading: _CrumbGlyph(label: 'W', color: Color(0xFF2563EB))),
    FadingBreadcrumbItem(label: 'Missions', leading: _CrumbGlyph(label: 'M', color: Color(0xFF0EA5E9)), enabled: false),
    FadingBreadcrumbItem(label: 'Telemetry', leading: _CrumbGlyph(label: 'T', color: Color(0xFF14B8A6))),
  ],
  currentIndex: _richBreadcrumbIndex,
  onChanged: (int index) {
    setState(() {
      _richBreadcrumbIndex = index;
    });
  },
  separatorBuilder: (BuildContext context, int _, FadingThemeData theme) {
    return Text('>', style: theme.bodyMedium.copyWith(color: theme.textMuted));
  },
)''',
        ),
      ],
    );
  }
}

class _CrumbGlyph extends StatelessWidget {
  const _CrumbGlyph({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          label,
          style: theme.labelLarge.copyWith(
            color: const Color(0xFFFFFFFF),
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class _AccordionPage extends StatelessWidget {
  const _AccordionPage({
    required this.page,
    required this.expandedIndex,
    required this.onChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final int? expandedIndex;
  final ValueChanged<int?> onChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingAccordion',
          sectionId: 'accordion-basic',
          visibleSections: visibleSections,
          summary:
              'Contenedor expandible para organizar contenido en secciones plegables.',
          tags: const <String>['accordion', 'disclosure', 'content'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingAccordion(
                label: 'Mission checklist',
                expandedIndex: expandedIndex,
                onChanged: onChanged,
                items: const <FadingAccordionItem>[
                  FadingAccordionItem(
                    title: 'Briefing',
                    subtitle: 'Review objective and route constraints.',
                    content: Text(
                      'Load route telemetry, verify weather bands, and '
                      'confirm crew alignment before rollout.',
                    ),
                  ),
                  FadingAccordionItem(
                    title: 'Diagnostics',
                    subtitle: 'Confirm subsystem integrity before ignition.',
                    content: Text(
                      'Run thermal scan, validate control relay timing, and '
                      'inspect fallback channels.',
                    ),
                  ),
                  FadingAccordionItem(
                    title: 'Launch',
                    subtitle: 'Arm system and lock timeline windows.',
                    content: Text(
                      'Coordinate launch sequence, publish status beacon, '
                      'and capture departure metrics.',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                expandedIndex == null
                    ? 'No section expanded.'
                    : 'Expanded section: ${expandedIndex! + 1}',
                style: theme.bodyMedium.copyWith(color: theme.accentStrong),
              ),
            ],
          ),
          code: '''FadingAccordion(
  label: 'Mission checklist',
  expandedIndex: _expandedAccordionIndex,
  onChanged: (int? value) {
    setState(() {
      _expandedAccordionIndex = value;
    });
  },
  items: const <FadingAccordionItem>[
    FadingAccordionItem(
      title: 'Briefing',
      subtitle: 'Review objective and route constraints.',
      content: Text('Load route telemetry...'),
    ),
    FadingAccordionItem(
      title: 'Diagnostics',
      subtitle: 'Confirm subsystem integrity before ignition.',
      content: Text('Run thermal scan...'),
    ),
  ],
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingAccordion (Disabled Item)',
          sectionId: 'accordion-disabled',
          visibleSections: visibleSections,
          summary:
              'Ejemplo de item bloqueado para mostrar estados no disponibles en la lista.',
          tags: const <String>['accordion', 'disabled', 'state'],
          preview: FadingAccordion(
            label: 'Operational readiness',
            expandedIndex: 0,
            onChanged: (_) {},
            items: const <FadingAccordionItem>[
              FadingAccordionItem(
                title: 'Core systems',
                content: Text('Primary channels are online.'),
              ),
              FadingAccordionItem(
                title: 'Payload bay',
                subtitle: 'Awaiting supervisor clearance.',
                enabled: false,
                content: Text('This section is disabled until approval.'),
              ),
            ],
          ),
          code: '''FadingAccordion(
  label: 'Operational readiness',
  expandedIndex: 0,
  onChanged: (_) {},
  items: const <FadingAccordionItem>[
    FadingAccordionItem(
      title: 'Core systems',
      content: Text('Primary channels are online.'),
    ),
    FadingAccordionItem(
      title: 'Payload bay',
      subtitle: 'Awaiting supervisor clearance.',
      enabled: false,
      content: Text('This section is disabled until approval.'),
    ),
  ],
)''',
        ),
      ],
    );
  }
}

class _SurfacesPage extends StatelessWidget {
  const _SurfacesPage({
    required this.page,
    required this.insetContainer,
    required this.onInsetChanged,
    this.visibleSections,
  });

  final DemoPage page;
  final bool insetContainer;
  final ValueChanged<bool> onInsetChanged;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    final FadingThemeData theme = FadingThemeScope.of(context);

    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingCard',
          sectionId: 'card',
          visibleSections: visibleSections,
          summary:
              'Tarjeta de superficie elevada para jerarquizar informacion relacionada.',
          tags: const <String>['surface', 'card', 'container'],
          preview: FadingCard(
            title: 'Command Console',
            child: Text(
              'Use cards for grouped content blocks with hierarchy.',
              style: theme.bodyMedium,
            ),
          ),
          code: '''FadingCard(
  title: 'Command Console',
  child: Text('Use cards for grouped content blocks.'),
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingSurface',
          sectionId: 'surface',
          visibleSections: visibleSections,
          summary:
              'Superficie base raised o inset para construir paneles y contenedores reutilizables.',
          tags: const <String>['surface', 'layout', 'container'],
          preview: FadingSurface(
            style: insetContainer
                ? FadingSurfaceStyle.inset
                : FadingSurfaceStyle.raised,
            child: Column(
              children: <Widget>[
                Text(
                  insetContainer
                      ? 'Inset surface style'
                      : 'Raised surface style',
                  style: theme.bodyMedium,
                ),
                const SizedBox(height: 10),
                FadingCheckbox(
                  label: 'Inset surface preview',
                  value: insetContainer,
                  onChanged: onInsetChanged,
                ),
              ],
            ),
          ),
          code: '''FadingSurface(
  style: _insetContainer
      ? FadingSurfaceStyle.inset
      : FadingSurfaceStyle.raised,
  child: const Text('Surface content'),
)''',
        ),
      ],
    );
  }
}

class _BadgePage extends StatelessWidget {
  const _BadgePage({required this.page, this.visibleSections});

  final DemoPage page;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    return _DocsPageLayout(
      page: page,
      children: <Widget>[
        _ShowcaseSection(
          title: 'FadingBadge (Default)',
          sectionId: 'badge-default',
          visibleSections: visibleSections,
          summary:
              'Badge compacto para estado y clasificacion en listas o paneles.',
          tags: const <String>['badge', 'status', 'label'],
          preview: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const <Widget>[
              FadingBadge(label: 'New'),
              FadingBadge(label: 'Queued'),
              FadingBadge(label: 'Archived'),
            ],
          ),
          code: '''FadingBadge(label: 'New')

FadingBadge(label: 'Queued')

FadingBadge(label: 'Archived')''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingBadge (Tones)',
          sectionId: 'badge-tone',
          visibleSections: visibleSections,
          summary:
              'Variantes semanticas para exito, advertencia y estado critico con color dependiente de tema.',
          tags: const <String>['badge', 'tone', 'semantic'],
          preview: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const <Widget>[
              FadingBadge(label: 'Neutral'),
              FadingBadge(label: 'Healthy', tone: FadingBadgeTone.success),
              FadingBadge(label: 'Attention', tone: FadingBadgeTone.warning),
              FadingBadge(label: 'Critical', tone: FadingBadgeTone.critical),
            ],
          ),
          code: '''FadingBadge(label: 'Neutral')

FadingBadge(
  label: 'Healthy',
  tone: FadingBadgeTone.success,
)

FadingBadge(
  label: 'Attention',
  tone: FadingBadgeTone.warning,
)

FadingBadge(
  label: 'Critical',
  tone: FadingBadgeTone.critical,
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingBadge (Color Source)',
          sectionId: 'badge-color-source',
          visibleSections: visibleSections,
          summary:
              'Permite alternar entre paleta basica fija y paleta derivada del tema activo.',
          tags: const <String>['badge', 'theme', 'colors'],
          preview: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Basic colors'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const <Widget>[
                  FadingBadge(
                    label: 'Healthy',
                    tone: FadingBadgeTone.success,
                    colorSource: FadingBadgeColorSource.basic,
                  ),
                  FadingBadge(
                    label: 'Attention',
                    tone: FadingBadgeTone.warning,
                    colorSource: FadingBadgeColorSource.basic,
                  ),
                  FadingBadge(
                    label: 'Critical',
                    tone: FadingBadgeTone.critical,
                    colorSource: FadingBadgeColorSource.basic,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text('Theme colors'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const <Widget>[
                  FadingBadge(
                    label: 'Healthy',
                    tone: FadingBadgeTone.success,
                    colorSource: FadingBadgeColorSource.theme,
                  ),
                  FadingBadge(
                    label: 'Attention',
                    tone: FadingBadgeTone.warning,
                    colorSource: FadingBadgeColorSource.theme,
                  ),
                  FadingBadge(
                    label: 'Critical',
                    tone: FadingBadgeTone.critical,
                    colorSource: FadingBadgeColorSource.theme,
                  ),
                ],
              ),
            ],
          ),
          code: '''FadingBadge(
  label: 'Healthy',
  tone: FadingBadgeTone.success,
  colorSource: FadingBadgeColorSource.basic,
)

FadingBadge(
  label: 'Healthy',
  tone: FadingBadgeTone.success,
  colorSource: FadingBadgeColorSource.theme,
)''',
        ),
        const SizedBox(height: 14),
        _ShowcaseSection(
          title: 'FadingBadge (Long Labels)',
          sectionId: 'badge-length',
          visibleSections: visibleSections,
          summary:
              'Etiquetas extensas se recortan en una sola linea sin romper el layout.',
          tags: const <String>['badge', 'text', 'overflow'],
          preview: const SizedBox(
            width: 260,
            child: FadingBadge(
              label: 'Node synchronization pending supervisor confirmation',
              tone: FadingBadgeTone.warning,
            ),
          ),
          code: '''SizedBox(
  width: 260,
  child: FadingBadge(
    label: 'Node synchronization pending supervisor confirmation',
    tone: FadingBadgeTone.warning,
  ),
)''',
        ),
      ],
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  const _ShowcaseSection({
    required this.title,
    required this.preview,
    required this.code,
    required this.sectionId,
    this.summary,
    this.tags = const <String>[],
    this.visibleSections,
  });

  final String title;
  final Widget preview;
  final String code;
  final String sectionId;
  final String? summary;
  final List<String> tags;
  final Set<String>? visibleSections;

  @override
  Widget build(BuildContext context) {
    if (visibleSections != null && !visibleSections!.contains(sectionId)) {
      return const SizedBox.shrink();
    }

    final FadingThemeData theme = FadingThemeScope.of(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: theme.titleLarge.copyWith(
              fontSize: 18,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 10),
          if (summary != null) ...<Widget>[
            Text(
              summary!,
              style: theme.bodyMedium.copyWith(
                color: const Color(0xFF475569),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 10),
          ],
          if (tags.isNotEmpty) ...<Widget>[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map(
                    (String value) =>
                        _HeaderTag(text: value, tone: _HeaderTagTone.subtle),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
          ],
          Text(
            'Demo interactivo',
            style: theme.titleLarge.copyWith(
              fontSize: 16,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: preview,
          ),
          const SizedBox(height: 12),
          Text(
            'Codigo',
            style: theme.titleLarge.copyWith(
              fontSize: 16,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                code,
                style: theme.bodyMedium.copyWith(
                  fontSize: 12,
                  color: const Color(0xFF1E293B),
                  fontFamily: 'monospace',
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
