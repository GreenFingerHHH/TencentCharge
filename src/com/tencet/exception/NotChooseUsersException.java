package com.tencet.exception;

public class NotChooseUsersException extends Exception {
    public NotChooseUsersException() {
        super();
    }

    public NotChooseUsersException(String message) {
        super(message);
    }

    public NotChooseUsersException(String message, Throwable cause) {
        super(message, cause);
    }

    public NotChooseUsersException(Throwable cause) {
        super(cause);
    }

    protected NotChooseUsersException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
