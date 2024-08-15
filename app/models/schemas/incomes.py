from datetime import datetime

from ..common import BaseAppModel


class AddIncomeRequest(BaseAppModel):
    income_category_id: int
    value: float
    datetime: datetime
