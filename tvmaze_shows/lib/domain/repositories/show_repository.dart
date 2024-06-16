import 'package:tvmaze_core/tvmaze_core.dart';
import 'package:tvmaze_shows/data/local_data_sources/local_show_data_source.dart';
import 'package:tvmaze_shows/data/remote_data_sources/remote_show_data_source.dart';
import 'package:tvmaze_shows/domain/models/show/show_model.dart';

abstract class ShowRepository {
  Future<List<ShowModel>> getShows(int page);
  Future<List<ShowModel>> searchShow(String query);
  Future<void> addFavoriteShow(ShowModel show);
  Future<void> removeFavoriteShow(ShowModel show);
  Future<List<ShowModel>> getFavoritesShows();
}

class ShowRepositoryImpl implements ShowRepository {
  ShowRepositoryImpl();

  final _remoteShowDataSource = GetIt.instance<RemoteShowDataSource>();
  final _localShowDataSource = GetIt.instance<LocalShowDataSource>();

  @override
  Future<List<ShowModel>> getShows(int page) async {
    try {
      final response = await _remoteShowDataSource.getShows(page);
      final List<ShowModel> shows = [];
      for (final data in response.data!) {
        shows.add(ShowModel.fromJson(data as Map<String, dynamic>));
      }
      return shows;
    } on DioException catch (e) {
      if (e.response != null) {
        throw TVMazeServerError(e.response!.statusMessage!);
      } else {
        throw TVMazeNetworkError(e.message ?? 'Network error');
      }
    } catch (e) {
      throw TVMazeUnknownError(e.toString());
    }
  }

  @override
  Future<List<ShowModel>> searchShow(String query) async {
    try {
      final response = await _remoteShowDataSource.searchShow(query);
      final List<ShowModel> shows = [];
      for (final data in response.data!) {
        final show = data['show'];
        shows.add(ShowModel.fromJson(show as Map<String, dynamic>));
      }
      return shows;
    } on DioException catch (e) {
      if (e.response != null) {
        throw TVMazeServerError(e.response!.statusMessage!);
      } else {
        throw TVMazeNetworkError(e.message ?? 'Network error');
      }
    } catch (e) {
      throw TVMazeUnknownError(e.toString());
    }
  }

  @override
  Future<void> addFavoriteShow(ShowModel show) async =>
      _localShowDataSource.addFavoriteShow(show);

  @override
  Future<List<ShowModel>> getFavoritesShows() async =>
      _localShowDataSource.getFavoritesShows();

  @override
  Future<void> removeFavoriteShow(ShowModel show) async =>
      _localShowDataSource.removeFavoriteShow(show);
}
