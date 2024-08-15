from app.models.common import BaseAppModel


class WrapperResponse(BaseAppModel):
    success: bool = True
    payload: dict = {}
    message: str = ""
