package com.tencet.exception;

public class NotFoundManagerException extends Exception {

    public NotFoundManagerException() {
        super();
    }

    public NotFoundManagerException(String message) {
        super(message);
    }

    public NotFoundManagerException(String message, Throwable cause) {
        super(message, cause);
    }

    public NotFoundManagerException(Throwable cause) {
        super(cause);
    }

    protected NotFoundManagerException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
