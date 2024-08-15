from fastapi import APIRouter, status

router = APIRouter()


@router.get("/get_info", status_code=status.HTTP_200_OK, name="test:get_info")
async def get_info():
    return {"info": "test_route"}
