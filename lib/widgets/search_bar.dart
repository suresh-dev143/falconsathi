import 'package:flutter/material.dart';
import 'dart:async';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final String hintText;
  final Duration debounceDuration;
  final bool enableVoiceSearch;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  const CustomSearchBar({
    Key? key,
    required this.onSearch,
    this.hintText = 'Search...',
    this.debounceDuration = const Duration(milliseconds: 500),
    this.enableVoiceSearch = false,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(widget.debounceDuration, () {
      widget.onSearch(query);
    });
  }

  void _expandSearchBar() {
    setState(() {
      _isExpanded = true;
      _animationController.forward();
    });
  }

  void _collapseSearchBar() {
    setState(() {
      _isExpanded = false;
      _searchController.clear();
      _animationController.reverse();
      widget.onSearch('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isExpanded ? 56 : 0,
              child: _isExpanded
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: widget.iconColor ?? Colors.grey[600],
                      ),
                      onPressed: _collapseSearchBar,
                    )
                  : null,
            ),
            Expanded(
              child: TextField(
                controller: _searchController,
                onTap: _expandSearchBar,
                onChanged: _onSearchChanged,
                style: TextStyle(
                  color: widget.textColor ?? Colors.black87,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color:
                        widget.textColor?.withOpacity(0.6) ?? Colors.grey[600],
                  ),
                  border: InputBorder.none,
                  prefixIcon: !_isExpanded
                      ? Icon(
                          Icons.search,
                          color: widget.iconColor ?? Colors.grey[600],
                        )
                      : null,
                  suffixIcon: _searchController.text.isNotEmpty
                      ? FadeTransition(
                          opacity: _fadeAnimation,
                          child: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: widget.iconColor ?? Colors.grey[600],
                            ),
                            onPressed: () {
                              _searchController.clear();
                              widget.onSearch('');
                            },
                          ),
                        )
                      : widget.enableVoiceSearch
                          ? IconButton(
                              icon: Icon(
                                Icons.mic,
                                color: widget.iconColor ?? Colors.grey[600],
                              ),
                              onPressed: () {
                                // Implement voice search functionality
                              },
                            )
                          : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}

// Usage Example:
// CustomSearchBar(
//   onSearch: (query) {
//     // Handle search
//   },
//   hintText: 'Search products...',
//   backgroundColor: Colors.white,
//   iconColor: Colors.blue,
//   textColor: Colors.black,
//   enableVoiceSearch: true,
// )
