from fastapi import APIRouter, status

from app.models.schemas.incomes import AddIncomeRequest
from app.models.wrapper import WrapperResponse

router = APIRouter()


@router.get("/", status_code=status.HTTP_200_OK, name="incomes:add")
async def add_income(request: AddIncomeRequest) -> WrapperResponse:
    return WrapperResponse()
