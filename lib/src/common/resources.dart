class Resource<T> {
  final Status status;
  final T data;
  final String message;

  bool get hasData => data != null;

  Resource.success(this.data)
      : status = Status.SUCCESS,
        message = null;

  Resource.loading()
      : status = Status.LOADING,
        data = null,
        message = null;

  Resource.error(this.message, this.data)
      : status = Status.ERROR;

  Resource.idle()
      : status = Status.IDLE,
        data = null,
        message = null;

  bool get isSuccess => status == Status.SUCCESS;
}

enum Status { LOADING, SUCCESS, ERROR, IDLE }