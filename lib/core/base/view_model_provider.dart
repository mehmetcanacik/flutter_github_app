import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _ViewModelProviderType { consumer, withoutConsumer }

class ViewModelProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T? viewModel;
  final Widget Function(BuildContext, T, Widget?) onPageBuilder;
  final Function(T)? onModelReady;
  final T Function()? viewModelBuilder;
  final bool? disposeViewModel;
  final Widget? staticChild;
  final bool createNewModelOnInsert;

  final _ViewModelProviderType providerType;
  ViewModelProvider.withoutConsumer(
      {Key? key,
      @Deprecated('ViewModel kullanımda değil.Onun yerine viewModelBuilder parametresini kullanın')
          this.viewModel,
      required this.onPageBuilder,
      this.onModelReady,
      this.disposeViewModel = true,
      required this.viewModelBuilder,
      this.createNewModelOnInsert = false})
      : providerType = _ViewModelProviderType.withoutConsumer,
        staticChild = null,
        super(key: key) {
    assert(viewModelBuilder != null || viewModel != null,
        'View Model Builder veya View Model Null Olamaz!');
  }

  ViewModelProvider.withConsumer({
    Key? key,
    required this.onPageBuilder,
    required this.viewModelBuilder,
    this.disposeViewModel = true,
    this.staticChild,
    this.onModelReady,
    @Deprecated('ViewModel kullanımda değil.Onun yerine viewModelBuilder parametresini kullanın')
        this.viewModel,
    this.createNewModelOnInsert = false,
  })  : providerType = _ViewModelProviderType.consumer,
        super(key: key) {
    assert(viewModel != null || viewModelBuilder != null,
        'View Model Builder veya View Model Null Olamaz!');
  }
  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends ChangeNotifier>
    extends State<ViewModelProvider<T>> {
  T? _getModel;
  @override
  void initState() {
    super.initState();
    if (_getModel == null) {
      _createOrSetViewModel();
      if (widget.onModelReady != null) {
        widget.onModelReady!(_getModel!);
      }
    } else if (widget.createNewModelOnInsert) {
      _createOrSetViewModel();
    }
  }

  void _createOrSetViewModel() {
    if (widget.viewModelBuilder != null) {
      _getModel = widget.viewModelBuilder!();
    } else {
      _getModel = widget.viewModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.providerType == _ViewModelProviderType.withoutConsumer) {
      if (!widget.disposeViewModel!) {
        return ChangeNotifierProvider<T>.value(
          value: _getModel!,
          child: widget.onPageBuilder(context, _getModel!, widget.staticChild!),
        );
      }
      return ChangeNotifierProvider<T>(
        create: (context) => _getModel!,
        child: widget.onPageBuilder(context, _getModel!, widget.staticChild!),
      );
    }
    if (!widget.disposeViewModel!) {
      return ChangeNotifierProvider<T>.value(
        value: _getModel!,
        child: Consumer<T>(
          builder: widget.onPageBuilder,
          child: widget.staticChild,
        ),
      );
    }
    return ChangeNotifierProvider<T>(
      create: (context) => _getModel!,
      child: Consumer<T>(
        builder: widget.onPageBuilder,
        child: widget.staticChild,
      ),
    );
  }
}
