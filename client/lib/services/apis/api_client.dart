import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:social_media_with_chatgpt/models/comment/comment.dart';
import 'package:social_media_with_chatgpt/models/file/file_model.dart';
import 'package:social_media_with_chatgpt/models/post/post.dart';
import 'package:social_media_with_chatgpt/models/profile/profile.dart';

import '../../models/user/user.dart';
import '../api_response/api_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  ///
  /// Auth
  ///
  @POST('/api/auth/login')
  Future<ApiResponse> login(@Body() Map<String, dynamic> body);

  @POST("/api/auth/register")
  Future<ApiResponse<User>> register(@Body() Map<String, dynamic> body);

  ///
  /// User & Profile
  ///
  @GET('/api/users')
  Future<ApiResponse<User>> getUser();

  @GET('/api/users/{userId}')
  Future<ApiResponse<User>> getUserByUserId(@Path("userId") String userId);

  @GET('/api/users/profile')
  Future<ApiResponse<Profile>> getUserProfile();

  @PATCH('/api/users/profile')
  Future<ApiResponse<Profile>> updateProfile(@Body() Map<String, dynamic> body);

  @PATCH('/api/users/profile-image')
  Future<ApiResponse<Profile>> updateProfileImage(@Body() FormData body);

  ///
  /// Post
  ///
  @POST('/api/posts')
  Future<ApiResponse<Post>> createPost(@Body() FormData body);

  @GET('/api/posts/{postId}')
  Future<ApiResponse<Post>> getPostById(@Path("postId") String postId);

  @GET('/api/posts/my-post')
  Future<ApiResponse<List<Post>>> getMyPost();

  @GET('/api/posts/all')
  Future<ApiResponse<List<Post>>> getAllPost();

  @PATCH('/api/posts/{postId}')
  Future<ApiResponse<Post>> updatePost(
      @Path("postId") String postId, @Body() Map<String, dynamic> body);

  @DELETE('/api/posts/{postId}')
  Future<ApiResponse> deletePost(@Path("postId") String postId);

  ///
  /// Comment
  ///
  @POST('/api/comments/{postId}')
  Future<ApiResponse<Comment>> createComment(
      @Path("postId") String postId, @Body() FormData body);

  @GET('/api/comments/{postId}/all')
  Future<ApiResponse<List<Comment>>> getCommentsByPost(
      @Path("postId") String postId);

  ///
  /// File
  ///
  @POST('/api/files/upload')
  Future<ApiResponse<FileModel>> uploadFile(@Body() FormData body);

  @POST('/api/files/multi-upload')
  Future<ApiResponse<List<FileModel>>> uploadMultiFile(@Body() FormData body);

  @POST('/api/files/{fileId}/detail')
  Future<ApiResponse<FileModel>> getDetailFile(@Path("fileId") String postId);
}
