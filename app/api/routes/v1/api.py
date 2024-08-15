from fastapi import APIRouter

from .incomes import router as incomes_router

router = APIRouter()

router.include_router(incomes_router, prefix="/incomes", tags=["Incomes"])
