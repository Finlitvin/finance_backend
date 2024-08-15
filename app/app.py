from fastapi import FastAPI

from app.core.config import get_app_settings
from app.core.events import create_start_app_handler, create_stop_app_handler
from app.api.routes.v1.api import router as api_router


def get_application():
    settings = get_app_settings()

    application = FastAPI(**settings.fastapi_kwargs)

    application.add_event_handler(
        "startup",
        create_start_app_handler(),
    )
    application.add_event_handler(
        "shutdown",
        create_stop_app_handler(),
    )

    application.include_router(api_router, prefix=settings.api_prefix)

    return application


app: FastAPI = get_application()
