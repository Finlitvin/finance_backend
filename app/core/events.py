from typing import Callable


def create_start_app_handler() -> Callable:
    async def start_app() -> None:
        pass

    return start_app


def create_stop_app_handler() -> Callable:
    async def stop_app() -> None:
        pass

    return stop_app
