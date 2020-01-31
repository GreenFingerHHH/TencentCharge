package com.tencet.exception;

public class GameNameHasExsistException extends Exception {
    public GameNameHasExsistException() {
        super();
    }

    public GameNameHasExsistException(String message) {
        super(message);
    }

    public GameNameHasExsistException(String message, Throwable cause) {
        super(message, cause);
    }

    public GameNameHasExsistException(Throwable cause) {
        super(cause);
    }

    protected GameNameHasExsistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
